library(HYRISK)


### Name: CREATE_INPUT
### Title: Function to define the input variables (imprecise, random or
###   fixed).
### Aliases: CREATE_INPUT

### ** Examples


#################################################
#### EXAMPLE 1 of Dubois & Guyonnet (2011)
#### Probability and Possibility distributions
#################################################

ninput<-5 #Number of input parameters
input<-vector(mode="list", length=ninput) # Initialisation

input[[1]]=CREATE_INPUT(
		name="UER",
		type="possi",
		distr="triangle",
		param=c(2.e-2, 5.7e-2, 1.e-1),
		monoton="incr"
		)
input[[2]]=CREATE_INPUT(
		name="EF",
		type="possi",
		distr="triangle",
		param=c(200,250,350),
		monoton="incr"
		)
input[[3]]=CREATE_INPUT(
		name="I",
		type="possi",
		distr="triangle",
		param=c(1,1.5,2.5),
		monoton="incr"
		)
input[[4]]=CREATE_INPUT(
		name="C",
		type="proba",
		distr="triangle",
		param=c(5e-3,20e-3,10e-3)
		)
input[[5]]=CREATE_INPUT(
		name="ED",
		type="proba",
		distr="triangle",
		param=c(10,50,30)
		)
		
#################################################
#### EXAMPLE 2 of Sch\"obi & Sudret (2016)
#### Imprecise Probability distributions
#################################################

ninput<-6 #Number of input parameters
input<-vector(mode="list", length=ninput) # Initialisation

# Imprecise normal probability 
# whose parameters are described by the 3rd and 5th parameters
input[[1]]=CREATE_INPUT(
		name="A",
		type="impr proba",
		distr="normal",
		param=c(3,5),
		monoton="dunno"
		)

# Imprecise normal probability
# whose parameters are described by the 4th and 6th parameters
input[[2]]=CREATE_INPUT(
		name="B",
		type="impr proba",
		distr="normal",
		param=c(4,6),
		monoton="dunno"
		)

# imprecise paramters of afore-described probability distribution
# mean of input number 1 as an interval
input[[3]]=CREATE_INPUT(
		name="mu_A",
		type="possi",
		distr="interval",
		param=c(-0.5,0.5)
		)

# mean of input number 2 as an interval
input[[4]]=CREATE_INPUT(
		name="mu_B",
		type="possi",
		distr="interval",
		param=c(-0.5,0.5)
		)

# standard deviation of input number 1  as an interval
input[[5]]=CREATE_INPUT(
		name="s_A",
		type="possi",
		distr="interval",
		param=c(0.7,1)
		)

# standard deviation of input number 2  as an interval
input[[6]]=CREATE_INPUT(
		name="s_B",
		type="possi",
		distr="interval",
		param=c(0.7,1)
		)
		



