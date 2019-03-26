library(afex)


### Name: md_12.1
### Title: Data 12.1 from Maxwell & Delaney
### Aliases: md_12.1
### Keywords: dataset

### ** Examples

data(md_12.1)

# Table 12.5 (p. 578):
aov_ez("id", "rt", md_12.1, within = c("angle", "noise"), 
       args.return=list(correction = "none", es = "none"))





