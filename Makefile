VER := 1

.PHONY: all bom cpl garber

all: bom cpl garber

bom: circuit-endless-soju-party-bom-raw.csv
	sed '/,""$$/d' circuit-endless-soju-party-bom-raw.csv >circuit-endless-soju-party-bom.csv

cpl: circuit-endless-soju-party-all-pos.csv
	sed '/^"[ ABE-QSTV-Z]/d' circuit-endless-soju-party-all-pos.csv >circuit-endless-soju-party-cpl.csv
	sed -i '/PCB_USB/d' circuit-endless-soju-party-cpl.csv
	patch -p1 <cpl-rename-col.patch

garber: out/circuit-endless-soju-party-B_Cu.gbl out/circuit-endless-soju-party-B_Mask.gbs out/circuit-endless-soju-party-B_Paste.gbp out/circuit-endless-soju-party-B_Silkscreen.gbo out/circuit-endless-soju-party-Edge_Cuts.gm1 out/circuit-endless-soju-party-F_Cu.gtl out/circuit-endless-soju-party-F_Mask.gts out/circuit-endless-soju-party-F_Paste.gtp out/circuit-endless-soju-party-F_Silkscreen.gto out/circuit-endless-soju-party-NPTH-drl_map.gbr out/circuit-endless-soju-party-NPTH.drl out/circuit-endless-soju-party-PTH-drl_map.gbr out/circuit-endless-soju-party-PTH.drl
	zip -r circuit-endless-soju-party-v$(VER).zip out/

# vim: noet
