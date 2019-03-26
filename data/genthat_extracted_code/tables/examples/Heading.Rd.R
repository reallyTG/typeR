library(tables)


### Name: Heading
### Title: 'Heading' pseudo-function
### Aliases: Heading

### ** Examples

tabular( (Sepal.Length+Sepal.Width) ~ 
         (Heading(Mean)*mean + (S.D.=sd)), data=iris )

heading <- "Variable Heading"
tabular( (Sepal.Length+Sepal.Width) ~ 
         (Heading(heading, character.only = TRUE)*mean + (S.D.=sd)), 
         data=iris )



