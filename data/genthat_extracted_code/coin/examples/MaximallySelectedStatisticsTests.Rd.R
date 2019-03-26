library(coin)


### Name: MaximallySelectedStatisticsTests
### Title: Generalized Maximally Selected Statistics
### Aliases: maxstat_test maxstat_test.formula maxstat_test.table
###   maxstat_test.IndependenceProblem
### Keywords: htest

### ** Examples

## Don't show: 
options(useFancyQuotes = FALSE)
## End(Don't show)
## Tree pipit data (Mueller and Hothorn, 2004)
## Asymptotic maximally selected statistics
maxstat_test(counts ~ coverstorey, data = treepipit)

## Asymptotic maximally selected statistics
## Note: all covariates simultaneously
mt <- maxstat_test(counts ~ ., data = treepipit)
mt@estimates$estimate


## Malignant arrythmias data (Hothorn and Lausen, 2003, Sec. 7.2)
## Asymptotic maximally selected statistics
maxstat_test(Surv(time, event) ~  EF, data = hohnloser,
             ytrafo = function(data)
                 trafo(data, surv_trafo = function(y)
                     logrank_trafo(y, ties.method = "Hothorn-Lausen")))


## Breast cancer data (Hothorn and Lausen, 2003, Sec. 7.3)
## Asymptotic maximally selected statistics
data("sphase", package = "TH.data")
maxstat_test(Surv(RFS, event) ~  SPF, data = sphase,
             ytrafo = function(data)
                 trafo(data, surv_trafo = function(y)
                     logrank_trafo(y, ties.method = "Hothorn-Lausen")))


## Job satisfaction data (Agresti, 2002, p. 288, Tab. 7.8)
## Asymptotic maximally selected statistics
maxstat_test(jobsatisfaction)

## Asymptotic maximally selected statistics
## Note: 'Job.Satisfaction' and 'Income' as ordinal
maxstat_test(jobsatisfaction,
             scores = list("Job.Satisfaction" = 1:4,
                           "Income" = 1:4))



