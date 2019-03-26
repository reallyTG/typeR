library(DistatisR)


### Name: Chi2Dist
### Title: chi2 distance between the rows of a rectangular matrix.
### Aliases: Chi2Dist
### Keywords: DistatisR

### ** Examples

# Here is a data matrix from Abdi & Williams (2012)
# page 449, Table 15. Punctuation of 6 French authors
Punctuation = matrix(c(
  7836,   13112,   6026,
 53655,   102383, 42413, 
115615,   184541, 59226, 
161926,   340479, 62754, 
 38177,   105101, 12670, 
 46371,    58367, 14299),
     ncol =3,byrow = TRUE)
colnames(Punctuation) <-c('Period','Comma','Other')
rownames(Punctuation) <-c('Rousseau','Chateaubriand',
                   'Hugo','Zola','Proust','Giroudoux') 
# 1. Get the Chi2 distance matrix
#     between the rows of Punctuation 
Dres <- Chi2Dist(Punctuation)
# check that the mds of the Chi2 distance matrix
# with CA-masses gives the CA factor scores for I 
# 2. Use function mmds from DistatisR 
#
testmds <- mmds(Dres$Distance,masses=Dres$masses)
# Print the MDS factor scores from mmds
print('Factor Scores from mds')
print(testmds$FactorScores)
print('It matches CA on X (see Abdi & Williams, 2010. Table 16, p. 449)')
# Et voila!



