library(abcdeFBA)


### Name: Gene_del
### Title: Gene_del, a function to create Gene Deletion mutants
### Aliases: 'gene deletion' 'genetic mutants ' Gene_del

### ** Examples

#To create a mutant model .
{data(Ec_iAF1260_flux1)
	ho<-Gene_del(c("b3040"),Ec_iAF1260_flux1,return_reactions=TRUE)
}



