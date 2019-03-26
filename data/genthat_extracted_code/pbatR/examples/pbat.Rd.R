library(pbatR)


### Name: pbat
### Title: PBAT Graphical and Command Line Interface
### Aliases: pbat pbat.last pbat.last.rawResults pbat.m pbat.obj pbat.files
###   pbat.create.commandfile
### Keywords: interface

### ** Examples


##########################
## pbat.m(...) examples ##
##########################

## Not run: 
##D 
##D ## Note, when you run the example (or anything else) you will generally
##D ##  get a warning message that the column headers were guessed.
##D ## This means they were guessed, and while I've tried to catch most
##D ##  cases, the warning stands for ones I might have missed.
##D 
##D ## These cannot be run verbatim, and are just meant to be examples.
##D 
##D ##############################
##D ## Further formula examples ##
##D ##############################
##D 
##D 
##D # load in the data
##D # Here we assume that:
##D #  data.phe contains 'preds1', 'preds2', 'preds3', 'time',
##D #                     'censor', 'phenos1', ... 'phenos4'
##D #  data.ped contains 'snp1', 'snp2', 'snp3',
##D #                     'block1snp1','block1snp2',
##D #                     'block2snp1','block2snp2'
##D data.phe <- read.phe( "data" )
##D data.ped <- read.ped( "data" )
##D 
##D # This model does just the affection status (always given as
##D #  AffectionStatus) as the phenotype, no predictor covariates, and all
##D #  the snps for a snps analysis.
##D # Since affection status is dichotomous, we additionally set
##D #  distribution='categorical'
##D #  offset='none'
##D # NONE is a special keyword to indicate none, and can be only used in
##D #  this case (note that it is _case_ _sensative_);
##D #  otherwise one specifies values from the phenotype object, after and
##D #  including AffectionStatus.
##D res <- pbat.m( AffectionStatus ~ NONE, phe, ped, fbat="gee",
##D                distribution='categorical', offset='none', ... )
##D summary( res )
##D res  # equivalent to print(res)
##D 
##D # basic model with one phenotype, does all snps (if none specified)
##D pbat.m( phenos1 ~ preds1, phe, ped, fbat="gee" )
##D 
##D # same model, but with more phenotypes; here we test them all at once
##D pbat.m( phenos1 + phenos2 + phenos3 ~ preds1, phe, ped, fbat="gee" )
##D 
##D # same model as just before, but now supposing that these phenotypes are
##D #  instead from a longitudinal study
##D pbat.m( phenos1 + phenos2 + phenos3 ~ preds1, phe, ped, fbat="pc" )
##D 
##D # like our second model, but the mi() tells it should be a marker
##D #  interaction
##D pbat.m( phenos1 ~ mi(preds1), phe, ped, fbat="gee" )
##D 
##D # logrank analysis - fbat need not be set
##D # uses more than one predictor variable
##D res <- pbat.m( time & censor ~ preds1 + preds2 + preds3, phe, ped )
##D plot( res )
##D 
##D # single snp analysis (because each snp is seperated by a vertical bar
##D #  '|'), and stratified by group (presence of censor auto-indicates
##D #  log-rank analysis).  Note that the group is at the end of the
##D #  expression, and _must_ be at the end of the expression
##D res <- pbat.m( time & censor ~ preds1^3 + preds2 | snp1 | snp2 |
##D          snp3 / group, temp )
##D plot( res )
##D 
##D # haplotype analysis, stratified by group
##D res <- pbat.m( time & censor ~ preds1^2 + preds2^3 | block1snp1
##D                + block1snp2 | block2snp1 + block2snp2 / group, temp )
##D 
##D # set any of the various options
##D res <- pbat.m( phenos ~ preds, phe, ped, fbat="pc",
##D                null="linkage, no association", alpha=0.1 )
##D 
##D ## New multimarker test (as described above)
##D # mmaxphenos and mmaxsnps are set to the minimum if not specified
##D res <- pbat.m( phenos1 + phenos2 + phenos3 ~ preds | m1 | m2 | m3 | m4,
##D                phe, ped, fbat="pc", mminphenos=2, mminsnps=2 )
##D 
##D ## And the top markers by conditional power
##D top( res )
## End(Not run)


############################
## pbat.obj(...) examples ##
############################

## Not run: 
##D # These will not function; they only serve as examples.
##D 
##D # ... just indicates there are various options to be put here!
##D res <- pbat.obj("pedfile", snps=c("snp1,snp2"), preds="pred1", ... )
##D summary(res)
##D res
##D 
##D # plot is only available for "logrank"
##D res <- pbat.obj(..., fbat="logrank")
##D plot( res )
## End(Not run)


##############################
## pbat.files(...) examples ##
##############################

## Not run: 
##D # These will not function, but only serve as examples.
##D 
##D # Note in the following example, both "pedfile.ped" and "pedfile.phe"
##D #  must exist.  If the names differed, then you must specify the
##D #  option 'phe="phefile.phe"', for example.
##D res <- pbat.files( "pedfile", phenos=c("phenos1","phenos2"),
##D                    screening="conditional power" )
##D summary(res)
##D res
## End(Not run)




