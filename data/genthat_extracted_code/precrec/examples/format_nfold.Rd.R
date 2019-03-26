library(precrec)


### Name: format_nfold
### Title: Create n-fold cross validation dataset from data frame
### Aliases: format_nfold

### ** Examples


##################################################
### Convert dataframe with 2 models and 5-fold datasets
###

## Load test data
data(M2N50F5)
head(M2N50F5)

## Convert with format_nfold
nfold_list1 = format_nfold(nfold_df = M2N50F5, score_cols = c(1, 2),
                          lab_col = 3, fold_col = 4)

## Show the list structure
str(nfold_list1)
str(nfold_list1$scores)
str(nfold_list1$labels)


##################################################
### Speficy a single score column
###

## Convert with format_nfold
nfold_list2 = format_nfold(nfold_df = M2N50F5, score_cols = 1,
                           lab_col = 3, fold_col = 4)

## Show the list structure
str(nfold_list2)
str(nfold_list2$scores)
str(nfold_list2$labels)


##################################################
### Use column names
###

## Convert with format_nfold
nfold_list3 = format_nfold(nfold_df = M2N50F5,
                           score_cols = c("score1", "score2"),
                           lab_col = "label", fold_col = "fold")

## Show the list structure
str(nfold_list3)
str(nfold_list3$scores)
str(nfold_list3$labels)




