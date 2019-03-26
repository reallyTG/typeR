library(Momocs)


### Name: classification_metrics
### Title: Calculate classification metrics on a confusion matrix
### Aliases: classification_metrics

### ** Examples

# some morphometrics on 'hearts'
hearts %>% fgProcrustes(tol=1) %>%
coo_slide(ldk=1) %>% efourier(norm=FALSE) %>% PCA() %>%
# now the LDA and its summary
LDA(~aut) %>% classification_metrics()



