library(projections)


### Name: project
### Title: Project future incidence
### Aliases: project

### ** Examples


## example using simulated Ebola outbreak
if (require(outbreaks) &&
    require(distcrete) &&
    require(incidence) &&
    require(magrittr)) {

si <- distcrete("gamma", interval = 1L,
                 shape = 0.37,
                 scale = 41.4, w = 0)

i <- incidence(ebola_sim$linelist$date_of_onset)
plot(i)


## projections after the first 100 days, over 60 days, fixed R to 2.1

set.seed(1)
proj_1 <- project(x = i[1:100], R = 2.1, si = si, n_days = 60)
plot(proj_1)

## add projections to incidence plot
plot(i[1:160]) %>% add_projections(proj_1)


## projections after the first 100 days, over 60 days, varying R

set.seed(1)
R <- rnorm(100, 1.8, 0.2)
hist(R, col = "grey", border = "white", main = "Distribution of R")
proj_2 <- project(x = i[1:100], R = R, si = si, n_days = 60)

## add projections to incidence plot
plot(i[1:160]) %>% add_projections(proj_2)


## same with R constant per simulation (more variability)

set.seed(1)
proj_3 <- project(x = i[1:100], R = R, si = si, n_days = 60,
                  R_fix_within = TRUE)

## add projections to incidence plot
plot(i[1:160]) %>% add_projections(proj_3)

}




