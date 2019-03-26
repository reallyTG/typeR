library(SimDesign)


### Name: runSimulation
### Title: Run a Monte Carlo simulation given a data.frame of conditions
###   and simulation functions
### Aliases: runSimulation print.SimDesign head.SimDesign tail.SimDesign
###   summary.SimDesign extract_results extract_error_seeds
###   as.data.frame.SimDesign

### ** Examples


#-------------------------------------------------------------------------------
# Example 1: Sampling distribution of mean

# This example demonstrate some of the simpler uses of SimDesign,
# particularly for classroom settings. The only factor varied in this simulation
# is sample size.

# skeleton functions to be saved and edited
SimFunctions()

#### Step 1 --- Define your conditions under study and create design data.frame

Design <- data.frame(N = c(10, 20, 30))

#~~~~~~~~~~~~~~~~~~~~~~~~
#### Step 2 --- Define generate, analyse, and summarise functions

# help(Generate)
Generate <- function(condition, fixed_objects = NULL){
    dat <- with(condition, rnorm(N, 10, 5)) # distributed N(10, 5)
    dat
}

# help(Analyse)
Analyse <- function(condition, dat, fixed_objects = NULL){
    ret <- mean(dat) # mean of the sample data vector
    ret
}

# help(Summarise)
Summarise <- function(condition, results, fixed_objects = NULL){
    ret <- c(mu=mean(results), SE=sd(results)) # mean and SD summary of the sample means
    ret
}


#~~~~~~~~~~~~~~~~~~~~~~~~
#### Step 3 --- Collect results by looping over the rows in design

# run the simulation
Final <- runSimulation(design=Design, replications=1000,
                       generate=Generate, analyse=Analyse, summarise=Summarise)
Final

# reproduce exact simulation
Final_rep <- runSimulation(design=Design, replications=1000, seed=Final$SEED,
                       generate=Generate, analyse=Analyse, summarise=Summarise)
Final_rep


#~~~~~~~~~~~~~~~~~~~~~~~~
#### Extras
# compare SEs estimates to the true SEs from the formula sigma/sqrt(N)
5 / sqrt(Design$N)

# To store the results from the analyse function either
#   a) omit a definition of of summarise(), or
#   b) pass save_results = TRUE to runSimulation() and read the results in with SimResults()

# e.g., the a) approach
results <- runSimulation(design=Design, replications=1000,
                       generate=Generate, analyse=Analyse)
str(results)
head(results[[1]])

# or b) approach
Final <- runSimulation(design=Design, replications=1000, save_results=TRUE,
                       generate=Generate, analyse=Analyse, summarise=Summarise)
results <- SimResults(Final)
str(results)
head(results[[1]]$results)

# remove the saved results from the hard-drive if you no longer want them
SimClean(results = TRUE)




#-------------------------------------------------------------------------------
# Example 2: t-test and Welch test when varying sample size, group sizes, and SDs

# skeleton functions to be saved and edited
SimFunctions()

## Not run: 
##D # in real-world simulations it's often better/easier to save
##D # these functions directly to your hard-drive with
##D SimFunctions('my-simulation')
## End(Not run)

#### Step 1 --- Define your conditions under study and create design data.frame

Design <- expand.grid(sample_size = c(30, 60, 90, 120),
                      group_size_ratio = c(1, 4, 8),
                      standard_deviation_ratio = c(.5, 1, 2))
dim(Design)
head(Design)

#~~~~~~~~~~~~~~~~~~~~~~~~
#### Step 2 --- Define generate, analyse, and summarise functions

Generate <- function(condition, fixed_objects = NULL){
    N <- condition$sample_size      # alternatively, could use Attach() to make objects available
    grs <- condition$group_size_ratio
    sd <- condition$standard_deviation_ratio
    if(grs < 1){
        N2 <- N / (1/grs + 1)
        N1 <- N - N2
    } else {
        N1 <- N / (grs + 1)
        N2 <- N - N1
    }
    group1 <- rnorm(N1)
    group2 <- rnorm(N2, sd=sd)
    dat <- data.frame(group = c(rep('g1', N1), rep('g2', N2)), DV = c(group1, group2))
    dat
}

Analyse <- function(condition, dat, fixed_objects = NULL){
    welch <- t.test(DV ~ group, dat)
    ind <- t.test(DV ~ group, dat, var.equal=TRUE)

    # In this function the p values for the t-tests are returned,
    #  and make sure to name each element, for future reference
    ret <- c(welch = welch$p.value, independent = ind$p.value)
    ret
}

Summarise <- function(condition, results, fixed_objects = NULL){
    #find results of interest here (e.g., alpha < .1, .05, .01)
    ret <- EDR(results, alpha = .05)
    ret
}


#~~~~~~~~~~~~~~~~~~~~~~~~
#### Step 3 --- Collect results by looping over the rows in design

# first, test to see if it works
Final <- runSimulation(design=Design, replications=5, store_results=TRUE,
                       generate=Generate, analyse=Analyse, summarise=Summarise)
head(Final)

## Not run: 
##D # complete run with 1000 replications per condition
##D Final <- runSimulation(design=Design, replications=1000, parallel=TRUE,
##D                        generate=Generate, analyse=Analyse, summarise=Summarise)
##D head(Final, digits = 3)
##D View(Final)
##D 
##D ## save final results to a file upon completion (not run)
##D runSimulation(design=Design, replications=1000, parallel=TRUE, save=TRUE, filename = 'mysim',
##D               generate=Generate, analyse=Analyse, summarise=Summarise)
##D 
##D 
##D 
##D ## Debug the generate function. See ?browser for help on debugging
##D ##   Type help to see available commands (e.g., n, c, where, ...),
##D ##   ls() to see what has been defined, and type Q to quit the debugger
##D runSimulation(design=Design, replications=1000,
##D               generate=Generate, analyse=Analyse, summarise=Summarise,
##D               parallel=TRUE, edit='generate')
##D 
##D ## Alternatively, place a browser() within the desired function line to
##D ##   jump to a specific location
##D Summarise <- function(condition, results, fixed_objects = NULL){
##D     #find results of interest here (e.g., alpha < .1, .05, .01)
##D     ret <- EDR(results[,nms], alpha = .05)
##D     browser()
##D     ret
##D }
##D 
##D runSimulation(design=Design, replications=1000,
##D               generate=Generate, analyse=Analyse, summarise=Summarise,
##D               parallel=TRUE)
##D 
##D 
##D 
##D 
##D ## EXTRA: To run the simulation on a MPI cluster, use the following setup on each node (not run)
##D # library(doMPI)
##D # cl <- startMPIcluster()
##D # registerDoMPI(cl)
##D # Final <- runSimulation(design=Design, replications=1000, MPI=TRUE, save=TRUE,
##D #                        generate=Generate, analyse=Analyse, summarise=Summarise)
##D # saveRDS(Final, 'mysim.rds')
##D # closeCluster(cl)
##D # mpi.quit()
##D 
##D 
##D ## Similarly, run simulation on a network linked via ssh
##D ##  (two way ssh key-paired connection must be possible between master and slave nodes)
##D ##
##D ## define IP addresses, including primary IP
##D # primary <- '192.168.2.20'
##D # IPs <- list(
##D #     list(host=primary, user='phil', ncore=8),
##D #     list(host='192.168.2.17', user='phil', ncore=8)
##D # )
##D # spec <- lapply(IPs, function(IP)
##D #                    rep(list(list(host=IP$host, user=IP$user)), IP$ncore))
##D # spec <- unlist(spec, recursive=FALSE)
##D #
##D # cl <- parallel::makeCluster(type='PSOCK', master=primary, spec=spec)
##D # Final <- runSimulation(design=Design, replications=1000, parallel = TRUE, save=TRUE,
##D #                        generate=Generate, analyse=Analyse, summarise=Summarise, cl=cl)
##D 
##D #~~~~~~~~~~~~~~~~~~~~~~~~
##D ###### Post-analysis: Analyze the results via functions like lm() or SimAnova(), and create
##D ###### tables(dplyr) or plots (ggplot2) to help visualize the results.
##D ###### This is where you get to be a data analyst!
##D 
##D library(dplyr)
##D Final2 <- tbl_df(Final)
##D Final2 %>% summarise(mean(welch), mean(independent))
##D Final2 %>% group_by(standard_deviation_ratio, group_size_ratio) %>%
##D    summarise(mean(welch), mean(independent))
##D 
##D # quick ANOVA analysis method with all two-way interactions
##D SimAnova( ~ (sample_size + group_size_ratio + standard_deviation_ratio)^2, Final)
##D 
##D # or more specific ANOVAs
##D SimAnova(independent ~ (group_size_ratio + standard_deviation_ratio)^2,
##D     Final)
##D 
##D # make some plots
##D library(ggplot2)
##D library(reshape2)
##D welch_ind <- Final[,c('group_size_ratio', "standard_deviation_ratio",
##D     "welch", "independent")]
##D dd <- melt(welch_ind, id.vars = names(welch_ind)[1:2])
##D 
##D ggplot(dd, aes(factor(group_size_ratio), value)) + geom_boxplot() +
##D     geom_abline(intercept=0.05, slope=0, col = 'red') +
##D     geom_abline(intercept=0.075, slope=0, col = 'red', linetype='dotted') +
##D     geom_abline(intercept=0.025, slope=0, col = 'red', linetype='dotted') +
##D     facet_wrap(~variable)
##D 
##D ggplot(dd, aes(factor(group_size_ratio), value, fill = factor(standard_deviation_ratio))) +
##D     geom_boxplot() + geom_abline(intercept=0.05, slope=0, col = 'red') +
##D     geom_abline(intercept=0.075, slope=0, col = 'red', linetype='dotted') +
##D     geom_abline(intercept=0.025, slope=0, col = 'red', linetype='dotted') +
##D     facet_grid(variable~standard_deviation_ratio) +
##D     theme(legend.position = 'none')
##D 
## End(Not run)




