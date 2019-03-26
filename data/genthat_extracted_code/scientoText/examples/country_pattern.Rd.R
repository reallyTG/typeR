library(scientoText)


### Name: country_pattern
### Title: Country Instances
### Aliases: country_pattern

### ** Examples

affiliations<-c("Stanford University, Stanford, CA, United States; Montreal, QC, Canada",
"Stanford University, United States; Google Inc., United States",
"University of Michigan, Ann Arbor, MI 48109-2122, United States;
Tsinghua University, Beijing 100084, China",
"Imperial College London, London, SW7 2BZ, United Kingdom;
ENSTA, Ecole Polytechnique, Palaiseau, 91761, France")

pub_years<-c(2012,2012,2013,2014)

country_pattern( affiliations, pub_years)
country_pattern(affiliations)



