library(runjags)


### Name: read.jagsfile
### Title: Extract Any Models, Data, Monitored Variables or Initial Values
###   As Character Vectors from a JAGS or WinBUGS Format Textfile
### Aliases: read.winbugs read.WinBUGS read.jagsfile read.JAGSfile
### Keywords: methods

### ** Examples

# ALL SYNTAX GIVEN BELOW IS EQUIVALENT

# Use a modified WinBUGS text file with manual inits and manual data and
# a seperate monitor block (requires least modification from a WinBUGS
# file).  For compatibility with WinBUGS, the use of list() to enclose
# data and initial values is allowed and ignored, however all seperate
# variables in the data and inits blocks must be seperated with a line
# break (commas or semicolons before linebreaks are ignored).  'data{'
# and 'inits{' must also be added to WinBUGS textfiles so that the
# function can seperate data from initial values.  Iterative loops are
# allowed in data blocks but not in init blocks.  See also the differences
# in JAGS versus WinBUGS syntax in the JAGS help file.

# The examples below are given as character strings for portability,
# but these could also be contained in a separate model file with the
# arguments to read.jagsfile and run.jags specified as the file path


# A model that could be used with WinBUGS, incorporating data and inits.
# A note will be produced that the data and inits are being converted
# from WinBUGS format:

string <- "
model{

	for(i in 1:N){
		Count[i] ~ dpois(mean)
	}
	mean ~ dgamma(0.01, 100)
}

data{
list(Count = c(1,2,3,4,5,6,7,8,9,10),
N = 10)
}

inits{
list(
	mean = 1)
}

inits{
list(
	mean = 100)
}

"

model <- read.winbugs(string)
results <- run.jags(string, monitor='mean')

# The same model but specified in JAGS format.  This syntax also defines
# monitors in the model, and uses data retrieved from the R environment:

string <- "
model{

	for(i in 1:N){
		Count[i] ~ dpois(mean) #data# Count, N
	}
	mean ~ dgamma(0.01, 100)
	#monitor# mean
}

inits{
	mean <- 1
}

inits{
	mean <- 100
}
"

model <- read.jagsfile(string)
Count <- 1:10
N <- length(Count)
results <- run.jags(string)


# The same model using autoinits and a mixture of manual and autodata:
string <- "
model{

	for(i in 1:N){ 
		Count[i] ~ dpois(mean) #data# Count
	}
	mean ~ dgamma(0.01, 100) 
	#monitor# mean
	#inits# mean
}

data{

	N <- 10

}
"

model <- read.jagsfile(string)
Count <- 1:10
mean <- list(1, 100)
results <- run.jags(string, n.chains=2)






