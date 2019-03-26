library(MicSim)


### Name: buildTransitionMatrix
### Title: Determining transition pattern and transition functions
### Aliases: buildTransitionMatrix

### ** Examples


#########################################################################################
# 1. Example: Transition rates are specified to depend on only one state variable
#########################################################################################
## No test: 
# Defintion of state space, i.e., nonabsorbing and absorbing states
sex <- c("m","f")                     
fert <- c("0","1","2","3+")           
marital <- c("NM","M","D","W")        
edu <- c("no","low","med","high")   
stateSpace <- expand.grid(sex=sex,fert=fert,marital=marital,edu=edu)

# Possible transitions indicating fertility behavior are "0->1", "1->2", "2->3+", 
# and "3+->3+". Here, "->" is the defined placeholder defining a transition.
# `fert1Rates' marks the name of the function defining the transition rates to 
# parity one and `fert2Rates' marks the name of the function defining the transition 
# rates to higher parities. 
# Note: The functions `fert1Rates' and `fert1Rates' are transition rate functions 
# defined by the user. Their naming depends on the user's choice.
fertTrMatrix <- cbind(c("0->1","1->2","2->3+","3+->3+"),                         
                c("fert1Rates", "fert2Rates", "fert2Rates","fert2Rates"))

# Possible transitions indicating changes in the marital status are "NM->M", "M->D", 
# "M->W", "D->M", and "W->M".
# `marriage1Rates' marks the name of the function defining the transition rates for first 
# marriage and `marriage2Rates' marks the name of the function defining the transition rates 
# for further marriages. `divorceRates' marks the name of the function defining divorce 
# rates and `widowhoodRates' marks the name of the function describing transition rates to 
# widowhood. 
# Note: The functions `marriage1Rates',`marriage2Rates', `divorceRates', and 
# `widowhoodRates' are transition rate functions defined by the user. 
# Their naming depends on the user's choice.
maritalTrMatrix <- cbind(c("NM->M","M->D","M->W","D->M","W->M"),              
                   c("marriage1Rates","divorceRates","widowhoodRates","marriage2Rates",
                     "marriage2Rates"))
                   
# Possible transitions indicating changes in the educational attainment are "no->low", 
# "low->med", and "med->high". 
# `noToLowEduRates' marks the name of the function defining transition rates for accessing 
# primary education, `noToLowEduRates' marks the name of the function defining transition 
# rates for graduating with a lower secondary education, and `medToHighEduRates' marks the 
# name of the function defining transition rates for graduating with a higher secondary 
# education.
# Note: The functions `noToLowEduRates',`noToLowEduRates', and `medToHighEduRates' are 
# transition rate functions defined by the user. Their naming depends on the user's 
# choice.                  
eduTrMatrix <- cbind(c("no->low","low->med","med->high"),
               c("noToLowEduRates","noToLowEduRates","medToHighEduRates")) 
               
# Combine all possible transitions and the related transition function into one matrix.          
allTransitions <- rbind(fertTrMatrix, maritalTrMatrix, eduTrMatrix)

# Possible absorbing states are `dead' and `rest'. (The latter indicates leaving the 
# population because of emigration). The accordant transition rate functions are named 
# `mortRates' and `emigrRates'. (Again, naming is up to the user.)
absTransitions <- rbind(c("dead","mortRates"),c("rest","emigrRates"))

# Construct `transition matrix'.
transitionMatrix <- buildTransitionMatrix(allTransitions,absTransitions,stateSpace)

#########################################################################################
# 2. Example: Transition rates are gender specific
#########################################################################################
# Defintion of nonabsorbing and absorbing states
sex <- c("m","f")                               
stateX <- c("H","P")        
stateSpace <- expand.grid(sex=sex,stateX=stateX)
absStates <- c("dead")   

# Transitions indicating changes in `stateX'. 
# We assume distinct transition rates for females and males.
# Note: The functions `ratesHP_f',`ratesHP_m', `ratesPH_f', and 
# `ratesPH_m' are transition rate functions defined by the user. 
trMatrix_f <- cbind(c("f/H->f/P","f/P->f/H"),c("ratesHP_f", "ratesPH_f"))
trMatrix_m <- cbind(c("m/H->m/P","m/P->m/H"),c("ratesHP_m", "ratesPH_m"))
allTransitions <- rbind(trMatrix_f,trMatrix_m)

# We assume gender specific mortality rates.
# Note: The naming and specification of the respective mortality rate functions 
# `mortRates_f' and `mortRates_m' depend on the user.
absTransitions <- rbind(c("f/dead","mortRates_f"), c("m/dead","mortRates_m"))

transitionMatrix <- buildTransitionMatrix(allTransitions=allTransitions,
                      absTransitions=absTransitions, stateSpace=stateSpace)

## End(No test)




