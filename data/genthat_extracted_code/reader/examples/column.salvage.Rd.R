library(reader)


### Name: column.salvage
### Title: Change column name in different form to desired form.
### Aliases: column.salvage

### ** Examples

df <- data.frame(Sex=c("M","F","F"),time=c(9,12,3),ID=c("ID3121","ID3122","ID2124"))
# standard example
new.df <- column.salvage(df,"sex",c("gender","sex","M/F")); df; new.df
# exact column already present so no change
new.df <- column.salvage(df,"ID",c("ID","id","ids","samples","subjectID")); df; new.df
# ignore case==TRUE potentially results in not finding desired column:
new.df <- column.salvage(df,"sex",c("gender","sex","M/F"),ignore.case=FALSE); df; new.df



