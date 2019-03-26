library(psych)


### Name: Gleser
### Title: Example data from Gleser, Cronbach and Rajaratnam (1965) to show
###   basic principles of generalizability theory.
### Aliases: Gleser
### Keywords: datasets

### ** Examples

#Find the MS for each component:
#First, stack the data
data(Gleser)
stack.g <- stack(Gleser)
st.gc.df <- data.frame(stack.g,Persons=rep(letters[1:12],12),
Items=rep(letters[1:6],each=24),Judges=rep(letters[1:2],each=12))
#now do the ANOVA
anov <- aov(values ~ (Persons*Judges*Items),data=st.gc.df)
summary(anov)



