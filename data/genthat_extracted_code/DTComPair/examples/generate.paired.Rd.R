library(DTComPair)


### Name: generate.paired
### Title: Generate Dataset from "tab.paired"-Object
### Aliases: generate.paired

### ** Examples

data(Paired1) # Hypothetical study data
ftable(Paired1)
paired.layout <- tab.paired(d=d, y1=y1, y2=y2, data=Paired1)
new.df <- generate.paired(paired.layout)
head(new.df)
ftable(new.df)



