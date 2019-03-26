library(afex)


### Name: md_16.4
### Title: Data 16.4 from Maxwell & Delaney
### Aliases: md_16.4
### Keywords: dataset

### ** Examples

# data for next examples (Maxwell & Delaney, Table 16.4)
data(md_16.4)
str(md_16.4)

### replicate results from Table 16.6 (Maxwell & Delaney, 2004, p. 845)
# p-values (almost) hold:
(mixed2 <- mixed(induct ~ cond + (1|room:cond), md_16.4))
# (1|room:cond) is needed because room is nested within cond.





