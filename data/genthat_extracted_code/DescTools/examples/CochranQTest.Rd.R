library(DescTools)


### Name: CochranQTest
### Title: Cochran's Q test
### Aliases: CochranQTest CochranQTest.default CochranQTest.formula

### ** Examples

# example in: 
# http://support.sas.com/documentation/cdl/en/statugfreq/63124/PDF/default/statugfreq.pdf
# pp. S. 1824

# use expand.grid, xtabs and Untable to create the dataset
d.frm <- Untable(xtabs(c(6,2,2,6,16,4,4,6) ~ ., 
    expand.grid(rep(list(c("F","U")), times=3))), 
    colnames = LETTERS[1:3])

# rearrange to long shape    
d.long <- reshape(d.frm, varying=1:3, times=names(d.frm)[c(1:3)], 
                  v.names="resp", direction="long")


# after having done the hard work of data organisation, performing the test is a piece of cake....
CochranQTest(resp ~ time | id, data=d.long)



