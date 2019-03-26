library(InPosition)


### Name: contingency.data.break
### Title: Bootstrap or permutation resampling for contingency tables
### Aliases: contingency.data.break
### Keywords: bootstrap permutation

### ** Examples

	data(authors)
	boot.authors <- contingency.data.break(authors$ca$data,boot=TRUE)
	perm.authors <- contingency.data.break(authors$ca$data)	



