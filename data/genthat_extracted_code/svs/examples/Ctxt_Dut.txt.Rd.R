library(svs)


### Name: Ctxt_Dut.txt
### Title: Context Words for seventeen Dutch Words
### Aliases: Ctxt_Dut.txt

### ** Examples

Ctxt_Dut <- read.table(system.file("extdata", "Ctxt_Dut.txt", package = "svs"),
   header = TRUE, sep = "\t", quote = "\"", encoding = "UTF-8")
sca.Ctxt_Dut <- fast_sca(data.matrix(Ctxt_Dut))
sca.Ctxt_Dut
lsa.Ctxt_Dut <- fast_lsa(data.matrix(Ctxt_Dut))
lsa.Ctxt_Dut



