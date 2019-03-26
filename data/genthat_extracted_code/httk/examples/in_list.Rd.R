library(httk)


### Name: in.list
### Title: Convenience Boolean (yes/no) functions to identify chemical
###   membership in several key lists.
### Aliases: in.list is.nhanes is.nhanes.serum.parent
###   is.nhanes.serum.analyte is.nhanes.blood.parent
###   is.nhanes.blood.analyte is.nhanes.urine.parent
###   is.nhanes.urine.analyte is.tox21 is.toxcast is.expocast is.httk
###   is.pharma

### ** Examples

httk.table <- get_cheminfo(info=c("CAS","Compound"))
httk.table[,"Rat"] <- ""
httk.table[,"NHANES"] <- ""
httk.table[,"Tox21"] <- ""
httk.table[,"ToxCast"] <- ""
httk.table[,"ExpoCast"] <- ""
httk.table[,"PBTK"] <- ""
# To make this example run quickly, this loop is only over the first fifty 
# chemicals. To build a table with all available chemicals use:
# for (this.cas in httk.table$CAS)
for (this.cas in httk.table$CAS[1:50])
{
  this.index <- httk.table$CAS==this.cas
  if (is.nhanes(this.cas)) httk.table[this.index,"NHANES"] <- "Y"
  if (is.tox21(this.cas)) httk.table[this.index,"Tox21"] <- "Y"
  if (is.toxcast(this.cas)) httk.table[this.index,"ToxCast"] <- "Y"
  if (is.expocast(this.cas)) httk.table[this.index,"ExpoCast"] <- "Y"
  if (is.httk(this.cas,model="PBTK")) httk.table[this.index,"PBTK"] <- "Y"
  if (is.httk(this.cas,species="rat")) httk.table[this.index,"Rat"] <- "Y"
}



