library(humanleague)


### Name: flatten
### Title: Convert multidimensional array of counts per state into table
###   form. Each row in the table corresponds to one individual
### Aliases: flatten

### ** Examples

gender=c(51,49)
age=c(17,27,35,21)
states=qis(list(1,2),list(gender,age))$result
table=flatten(states,c("Gender","Age"))
print(nrow(table[table$Gender==1,])) # 51
print(nrow(table[table$Age==2,])) # 27



