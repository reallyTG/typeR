library(AMCP)


### Name: chapter_1_table_1
### Title: The data used in Chapter 1, Table 1
### Aliases: chapter_1_table_1 C1T1 Chapter_1_Table_1 c1t1
### Keywords: datasets

### ** Examples

# Load the data
data(chapter_1_table_1)

# Or, alternatively load the data as
data(C1T1)

# View the structure
str(chapter_1_table_1)

chapter_1_table_1$Difference <- chapter_1_table_1$treat - chapter_1_table_1$control

# Summaries by week. 
summary(chapter_1_table_1[chapter_1_table_1$week==1,])
summary(chapter_1_table_1[chapter_1_table_1$week==2,])



