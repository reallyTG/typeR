library(TeachingDemos)


### Name: ci.examp
### Title: Plot examples of Confidence Intervals
### Aliases: ci.examp run.ci.examp
### Keywords: hplot dynamic univar

### ** Examples

ci.examp()

if(interactive()) {
  run.ci.examp()
}

# 1 sided confidence intervals
ci.examp(lower.conf=0, upper.conf=0.95)

# non-symmetric intervals
ci.examp(lower.conf=0.02, upper.conf=0.97)



