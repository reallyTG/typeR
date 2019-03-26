library(snplist)


### Name: setSNPTable
### Title: setSNPTable
### Aliases: setSNPTable
### Keywords: database

### ** Examples

    snpInfo <- cbind(c(17,17,13,13),
		     c(41211653, 41213996, 32890026,32890572),
		     c("rs8176273","rs8176265","rs9562605","rs1799943") )
    colnames(snpInfo) <- c('chr','pos','rsid')
    setSNPTable(as.data.frame(snpInfo))



