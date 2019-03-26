## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse=TRUE,comment='#>')

## ----results='asis'------------------------------------------------------
library(themetagenomics)
with(DAVID,table(META$Site,META$Donor))

## ------------------------------------------------------------------------
DAVID$ABUND[1:5,1:5]

## ------------------------------------------------------------------------
DAVID$TAX[1:5,1:4]

## ------------------------------------------------------------------------
DAVID$META[1:5,1:5]

## ------------------------------------------------------------------------
CLEAN <- prepare_data(otu_table=DAVID$ABUND,
                      rows_are_taxa=FALSE,
                      tax_table=DAVID$TAX,
                      metadata=DAVID$META,
                      formula=~Site + s(Day),
                      refs='UBERON:saliva',
                      cn_normalize=FALSE,
                      drop=TRUE)

## ------------------------------------------------------------------------
system.time(TOPICS <- find_topics(CLEAN,K=15))

## ------------------------------------------------------------------------
TOPICS

## ------------------------------------------------------------------------
system.time(TOPIC_EFFECTS <- est(TOPICS))

## ------------------------------------------------------------------------
TOPIC_EFFECTS

## ------------------------------------------------------------------------
TOPIC_EFFECTS$topic_effects$`SiteUBERON:feces`$est

## ------------------------------------------------------------------------
TOPIC_EFFECTS$topic_effects$Day$est

## ----eval=FALSE----------------------------------------------------------
#  vis(TOPIC_EFFECTS,type='taxa')

## ----eval=FALSE----------------------------------------------------------
#  vis(TOPIC_EFFECTS,type='continuous')

## ------------------------------------------------------------------------
system.time({
tmp <- tempdir()
download_ref(tmp,reference='silva_ko',overwrite=FALSE)
FUNCTIONS <- predict(TOPICS,reference='silva_ko',reference_path=tmp,cn_normalize=TRUE,sample_normalize=FALSE,scalar=25)
})

## ----eval=FALSE----------------------------------------------------------
#  FUNCTION_EFFECTS <- est(FUNCTIONS,level=3,iters=300,
#                          chains=2,cores=2,
#                          return_summary=TRUE,
#                          prior=c('normal','normal','normal'))

## ----eval=FALSE----------------------------------------------------------
#  FUNCTION_EFFECTS2 <- resume(FUNCTION_EFFECTS,init_type='last',iters=600,chains=2,cores=2)

## ----eval=FALSE----------------------------------------------------------
#  vis(FUNCTION_EFFECTS2,TOPIC_EFFECTS,ui_level=.95)

