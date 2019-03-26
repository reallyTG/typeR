library(microsynth)


### Name: microsynth
### Title: Synthetic control methods for micro- and meso-level data.
### Aliases: microsynth

### ** Examples

# Use seattledmi, block-level panel data, to evaluate a crime intervention.
# Declare time-variant (outcome) and time-invariant variables for matching
cov.var <- c('TotalPop', 'BLACK', 'HISPANIC', 'Males_1521',
       'HOUSEHOLDS', 'FAMILYHOUS', 'FEMALE_HOU', 'RENTER_HOU', 'VACANT_HOU')

## No test: 
match.out <- c('i_felony', 'i_misdemea', 'i_drugs', 'any_crime')

set.seed(99199) # for reproducibility

# Perform matching and estimation, without permutations or jackknife
# runtime: < 1 min
sea1 <- microsynth(seattledmi, idvar='ID', timevar='time',
       intvar='Intervention', start.pre=1, end.pre=12, end.post=16,
       match.out=match.out, match.covar=cov.var, result.var=match.out,
       omnibus.var=match.out, plot.var=match.out, test='lower')

# View results
summary(sea1)

# Repeat matching and estimation, with permutations and jackknife
# Set permutations and jack-knife to very few groups (2) for
# quick demonstration only.
# runtime: ~30 min
sea2 <- microsynth(seattledmi, idvar='ID', timevar='time',
        intvar='Intervention', start.pre=1, end.pre=12, end.post=c(14, 16),
        match.out=match.out, match.covar=cov.var, result.var=match.out,
        omnibus.var=match.out, plot.var=match.out, test='lower', perm=250,
        jack=TRUE, plot.file=NULL, sep = TRUE,
        result.file=file.path(tempdir(), 'ExResults2.xlsx'))

# View results
summary(sea2)

# Specify additional outcome variables for matching, which makes
# matching harder.
match.out <- c('i_robbery','i_aggassau','i_burglary','i_larceny',
       'i_felony','i_misdemea','i_drugsale','i_drugposs','any_crime')

# Perform matching, setting check.feas = T and use.backup = T
# to ensure model feasibility
# runtime: ~40 minutes
sea3 <- microsynth(seattledmi, idvar='ID', timevar='time',
        intvar='Intervention', match.out=match.out, match.covar=cov.var,
        start.pre=1, end.pre=12, end.post=16,
        result.var=match.out, plot.var=match.out, perm=250, jack=0,
        test='lower', check.feas=TRUE, use.backup = TRUE,
        plot.file=NULL, result.file=file.path(tempdir(), 'ExResults3.xlsx'))

# Aggregate outcome variables before matching, to boost model feasibility
match.out <- list( 'i_robbery'=rep(2, 6), 'i_aggassau'=rep(2, 6),
         'i_burglary'=rep(1, 12), 'i_larceny'=rep(1, 12),
         'i_felony'=rep(2, 6), 'i_misdemea'=rep(2, 6),
         'i_drugsale'=rep(4, 3), 'i_drugposs'=rep(4, 3),
         'any_crime'=rep(1, 12))

# After aggregation, use.backup and cheack.feas no longer needed
# runtime: ~40 minutes
sea4 <- microsynth(seattledmi, idvar='ID', timevar='time',
         intvar='Intervention', match.out=match.out, match.covar=cov.var,
         start.pre=1, end.pre=12, end.post=16,
         result.var=names(match.out), omnibus.var=names(match.out),
         plot.var=names(match.out), perm=250, jack = TRUE, test='lower',
         plot.file='ExPlots4.pdf', result.file=file.path(tempdir(), 'ExResults4.xlsx'))

## End(No test)

# Generate weights only (for four variables)
match.out <- c('i_felony', 'i_misdemea', 'i_drugs', 'any_crime')

## No test: 
# runtime: ~ 20 minutes
sea5 <- microsynth(seattledmi,  idvar='ID', timevar='time',
         intvar='Intervention', match.out=match.out, match.covar=cov.var,
         start.pre=1, end.pre=12, end.post=16,
         result.var=FALSE, plot.var=FALSE, perm=250, jack=TRUE)


# View weights
summary(sea5)

# Generate plots only using previous weights
# runtime: ~ 1 min

# Generate results only
# runtime: < 5 minutes
sea7 <- microsynth(seattledmi, idvar='ID', timevar='time',
          intvar='Intervention',
          start.pre=1, end.pre=12, end.post=c(14, 16),
          result.var=match.out, plot.var=FALSE, test='lower',
          w=sea5$w, result.file=file.path(tempdir(), 'ExResults7.xlsx'))

# View results (including previously-found weights)
summary(sea7)
## End(No test)

# Apply microsynth in the traditional setting of Synth
# Create macro-level (small n) data, with 1 treatment unit
set.seed(86872)
ids.t <- names(table(seattledmi$ID[seattledmi$Intervention==1]))
ids.c <- names(table(seattledmi$ID[seattledmi$Intervention==0]))
ids.synth <- c(base::sample(ids.t, 1), base::sample(ids.c, 100))
seattledmi.one <- seattledmi[is.element(seattledmi$ID,
           as.numeric(ids.synth)), ]


# Apply microsynth to the new macro-level data
# runtime: < 5 minutes
sea8 <- microsynth(seattledmi.one, idvar='ID', timevar='time',
           intvar='Intervention',
           start.pre=1, end.pre=12, end.post=16,
           match.out=match.out[4],
           match.covar=cov.var, result.var=match.out[4],
           plot.var=match.out[4], test='lower', perm=250, jack=FALSE,
           check.feas=TRUE, use.backup=TRUE)

## Not run: 
##D # Use microsynth to calculate propensity score-type weights
##D # Prepare cross-sectional data at time of intervention
##D seattledmi.cross <- seattledmi[seattledmi$time==16, colnames(seattledmi)!="time"]#'
##D 
##D # Apply microsynth to find propensity score-type weights
##D # runtime: ~5 minutes
##D sea9 <- microsynth(seattledmi.cross, idvar='ID', intvar='Intervention',
##D              match.out=FALSE, match.covar=cov.var, result.var=match.out,
##D              test='lower', perm=250, jack=TRUE)
##D 
##D # View results
##D summary(sea9)
## End(Not run)




