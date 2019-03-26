library(cytoDiv)


### Name: cytoDiv
### Title: Cytometric Diversity Indices
### Aliases: cytoDiv

### ** Examples


## reading from a fcs dataframe

fcs.df <- system.file("extdata","fcs_dataframe.csv", 
				package="cytoDiv")
df <- read.csv(fcs.df)

## looking at the first rows of the data frame
head(df)

## plotting bivariate plot
rainbow.cols <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F", "yellow","#FF7F00", "red", "#7F0000"))
plot(df[,2], df[,3], col= densCols(df[,2], df[,3], colramp = rainbow.cols))

# Remove the Internal Standard and noise before calculating the Cytometric Diversity Indices
cleaned.df <- subset(df, df[,4]  < df[,3] + 13000 & df[,3] > 5000)
plot(cleaned.df[,2], cleaned.df[,3], col= densCols(cleaned.df[,2], cleaned.df[,3], colramp = rainbow.cols))

#Calculating the Cytometric Diversity Indices
div <- cytoDiv(cleaned.df, x.var="FSC", y.var="F692.4", do.plot=TRUE)

print(div)




