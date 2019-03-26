library(textometry)


### Name: specificities
### Title: Calculate Lexical Specificity Score
### Aliases: specificities

### ** Examples

data(robespierre);
spe <- specificities(robespierre);
string <- paste("The word %s appears f=%d times in a sub-corpus of t=%d words,",
" given a total frequency of F=%d in the robespierre corpus made",
" of T=%d words. The corresponding specificity score is %f", sep="");
print(sprintf(string,
'peuple',
robespierre['peuple','D4'],
colSums(robespierre)['D4'],
rowSums(robespierre)['peuple'],
sum(robespierre),
spe['peuple', 'D4']));



