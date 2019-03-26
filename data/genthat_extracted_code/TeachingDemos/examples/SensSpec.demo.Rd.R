library(TeachingDemos)


### Name: SensSpec.demo
### Title: Demonstrate Sensitivity, Specificity, PPV, and NPV
### Aliases: SensSpec.demo
### Keywords: univar

### ** Examples

for(i in seq(1,11,2)) {
  SensSpec.demo(sens=0.95, spec=0.99, prev=0.01, step=i)
  if( interactive() ) {
    readline("Press Enter to continue")
  }
}



