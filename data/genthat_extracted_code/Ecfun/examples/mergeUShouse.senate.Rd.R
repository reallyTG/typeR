library(Ecfun)


### Name: mergeUShouse.senate
### Title: Expand a dataset on some members of the US Congress to the
###   entire membership
### Aliases: mergeUShouse.senate
### Keywords: manip

### ** Examples

tst <- data.frame(Office=factor(rep(c('House', 'Senate'), c(4, 2))),
         State=factor(c('Missouri', 'Minnesota', 'Tennessee',
                        'New York', rep('South Carolina', 2))),
         state=factor(c('MO', 'MN', 'TN', 'NY', 'SC', 'SC')),
         district=as.character(c(4, 1, 8, 18, 2, 3)),
         surname=c('Hartzler', 'Walz', 'Fincher', 'Maloney',
                   'Graham', 'DeMint'),
         givenName=c('Vicky', 'Timothy J.', 'Stephen Lee',
                   'Sean Patrick', 'Lindsey', 'Jim'),
         Party=c('Republican', 'Democrat', 'Republican', 'Democrat',
                 'Republican', 'Democrat'),
         CommitteeMember=rep(c(TRUE, FALSE), c(4, 2)),
         amount=c(5000, 2000, 29500, 1000, 1000, 11500),
         xvote=c('Y', 'N', 'Y', 'Y', 'notEligible', 'notEligible'),
         incumbent=NA, stringsAsFactors=FALSE )
         
if(!fda::CRAN()){         
  tst2 <- mergeUShouse.senate(tst)

# A couple of simple tests;  don't test too much,
# because the results of UShouse.senate change,
# and we don't want this test to fail
# due to changes that don't affect Ecdat code

  tst3 <- tst2[!tst2$amount0, c(1, 4:6, 8:10)]
  row.names(tst) <- row.names(tst3)

## Not run: 
##D   all.equal(tst[c(1, 4:6, 8:10)], tst3)
## End(Not run)
# tst3[2] = state = factor with 56 levels,
# and tst[2] only has 5;  compare without this

}



