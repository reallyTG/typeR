library(incidence)


### Name: pool
### Title: Pool 'incidence' across groups
### Aliases: pool

### ** Examples

dat <- as.integer(c(0,1,2,2,3,5,7))
group <- factor(c(1, 2, 3, 3, 3, 3, 1))
i <- incidence(dat, groups = group)
i
i$counts

## pool all groups
pool(i)
pool(i)$counts

## pool only groups 1 and 3
pool(i[,c(1,3)])
pool(i[,c(1,3)])$counts




