library(asht)


### Name: bfTest
### Title: Behrens-Fisher Test
### Aliases: bfTest bfTest.default bfTest.formula
### Keywords: htest

### ** Examples

## Classical example: Student's sleep data
## Traditional interface
with(sleep, bfTest(extra[group == 1], extra[group == 2]))
## Formula interface
bfTest(extra ~ group, data = sleep)
## Results are simular to Welch's t-test, 
## but a little more conservative
t.test(extra~group,data=sleep)



