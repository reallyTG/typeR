library(genetics)


### Name: diseq
### Title: Estimate or Compute Confidence Interval for the Single-Marker
###   Disequilibrium
### Aliases: diseq diseq.table diseq.genotype diseq.ci print.diseq
### Keywords: misc

### ** Examples

## Don't show: 
set.seed(7981357)
## End(Don't show)
example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

diseq(g1)
diseq.ci(g1)
HWE.test(g1)  # does the same, plus tests D-hat=0

three.data   <- c(rep("A/A",8),
                  rep("C/A",20),
                  rep("C/T",20),
                  rep("C/C",10),
                  rep("T/T",3))

g3  <- genotype(three.data)
g3

diseq(g3)
diseq.ci(g3, ci.B=10000, ci.type="bca")

# only show observed vs expected table
print(diseq(g3),show='table')




