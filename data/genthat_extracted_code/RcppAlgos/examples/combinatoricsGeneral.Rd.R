library(RcppAlgos)


### Name: comboGeneral
### Title: Generate all Combinations/Permutations of a Vector with/without
###   Constraints
### Aliases: comboGeneral permuteGeneral

### ** Examples

system.time(comboGeneral(17, 8))
system.time(permuteGeneral(13, 6))

system.time(comboGeneral(13,10,repetition = TRUE))
system.time(permuteGeneral(factor(letters[1:9]),6,TRUE))

## permutations of the multiset (with or w/o setting m) :
## c(1,1,1,1,2,2,2,3,3,4,4,4,4,4)
system.time(permuteGeneral(4, freqs = c(4,3,2,5)))

permuteGeneral(4, m = 2, freqs = c(4,3,2,5))

## or combinations
comboGeneral(4, m = 2, freqs = c(4,3,2,5))


#### Examples using "upper" and "lower":

## Generate some random data
set.seed(1009)
mySamp = sort(rnorm(75, 997, 23))

permuteCount(75, 10, freqs = rep(1:3, 25))
# >Big Integer ('bigz') :
# >[1] 4606842576291495952

## See specific range of permutations
permuteGeneral(75, 10, freqs = rep(1:3, 25), 
               lower = 1e12, upper = 1e12 + 10)

## Researcher only needs 1000 7-tuples of mySamp
## such that the sum is greater than 7200.
system.time(comboGeneral(mySamp, 7, FALSE, constraintFun = "sum",
             comparisonFun = ">", limitConstraints = 7200, upper = 1000))

## If you leave "upper" NULL in examples like the above,
## it can take much longer when the total number of
## possible combinations is large (still fast enough
## most of the time). In some cases, it can crash your
## computer as the underlying code allocates enough
## space to account for every combination (e.g. In our
## example, there are choose(75, 7) = 1984829850 rows,
## 7 columns, with each cell occupying 8 bytes. This
## gives a total over 100 GB (i.e. choose(75,7)*7*8/(2^30))

## Similarly, you can use "lower" to obtain the last rows.
## Generate the last 10 rows
system.time(comboGeneral(mySamp, 7, lower = choose(75, 7) - 9))

## Or if you would like to generate a specific chunk,
## use both "lower" and "upper". E.g. Generate one
## million combinations starting with the 900,000,001
## lexicographic combination.
t1 = comboGeneral(mySamp, 7, lower = 9*10^8 + 1, 
                        upper = 9*10^8 + 10^6)

## class of the source vector is preserved
class(comboGeneral(5,3)[1,]) == class(1:5)
class(comboGeneral(c(1,2:5),3)[1,]) == class(c(1,2:5))
class(comboGeneral(factor(month.name),3)[1,]) == class(factor(month.name))

## Using keepResults will add a column of results
t2 = permuteGeneral(-3,6,TRUE,constraintFun = "prod", 
                         keepResults = TRUE)

t3 = comboGeneral(-3,6,TRUE,constraintFun = "sum", 
                        comparisonFun = "==",
                        limitConstraints = -8, 
                        keepResults = TRUE)
                        
## Using multiple constraints:

## Get combinations such that the product
## is between 3000 and 4000 inclusive
comboGeneral(5, 7, TRUE, constraintFun = "prod",
             comparisonFun = c(">=","<="),
             limitConstraints = c(3000, 4000),
             keepResults = TRUE)
             
## Or, get the combinations such that the
## product is less than or equal to 10 or
## greater than or equal to 40000
comboGeneral(5, 7, TRUE, constraintFun = "prod",
             comparisonFun = c("<=",">="),
             limitConstraints = c(10, 40000),
             keepResults = TRUE)
             
## Using FUN
comboGeneral(10000, 5, lower = 20, upper = 22, 
             FUN = function(x) {
                 which(cummax(x) %% 2 == 1)
             })
# [[1]]
# [1] 1 3
# 
# [[2]]
# [1] 1 3 5
# 
# [[3]]
# [1] 1 3

## Not run: 
##D ## Parallel example generating more than 2^31 - 1 combinations.
##D library(parallel)
##D numCores = detectCores() - 1
##D 
##D system.time(mclapply(seq(1, comboCount(35, 15), 10086780), function(x) {
##D     a = comboGeneral(35, 15, lower = x, upper = x + 10086779)
##D     ## do something
##D     x
##D }, mc.cores = numCores))
##D 
##D 
##D ## Find 13-tuple combinations of 1:25 such
##D ## that the mean is less than 10
##D system.time(myComb <- comboGeneral(25, 13, FALSE,
##D                                    constraintFun = "mean",
##D                                    comparisonFun = "<",
##D                                    limitConstraints = 10))
##D 
##D ## Alternatively, you must generate all combinations and subsequently
##D ## subset to obtain the combinations that meet the criteria
##D system.time(myComb2 <- combn(25, 13))
##D system.time(myCols <- which(colMeans(myComb2) < 10))
##D system.time(myComb2 <- myComb2[, myCols])
##D 
##D ## Any variation is much slower
##D system.time(myComb2 <- combn(25, 13)[,combn(25, 13, mean) < 10])
##D 
##D ## Test equality with myComb above
##D all.equal(myComb, t(myComb2))
##D 
##D ## Fun example... see stackoverflow:
##D ## https://stackoverflow.com/q/22218640/4408538
##D system.time(permuteGeneral(seq(0L,100L,10L),8,TRUE,
##D                                 constraintFun = "sum", 
##D                                 comparisonFun = "==",
##D                                 limitConstraints = 100, upper = 10^5))
## End(Not run)



