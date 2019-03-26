library(ibelief)


### Name: PCR6
### Title: PCR6 rule
### Aliases: PCR6

### ** Examples

## The conflict table for two experts in a discernment frame with three elements
TabConflict=ConflictTable(2^3,2)
m1=c(0,0.4, 0.1, 0.2, 0.2, 0, 0, 0.1);
m2=c(0,0.2, 0.3, 0.1, 0.1, 0, 0.2, 0.1);
PCR6(cbind(m1,m2),TabConflict)



