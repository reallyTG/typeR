library(phylosim)


### Name: summary.UNREST
### Title: Summarize the properties of an object
### Aliases: summary.UNREST UNREST.summary summary,UNREST-method

### ** Examples

       # create an object
       p<-UNREST(rate.list=list(
		"T->C"=1, "T->A"=2, "T->G"=3, "C->T"=4, "C->A"=1,
		"C->G"=2, "A->T"=3, "A->C"=4, "A->G"=1, "G->T"=2,
		"G->C"=3, "G->A"=4
	))
       # get a summary
       summary(p)
 


