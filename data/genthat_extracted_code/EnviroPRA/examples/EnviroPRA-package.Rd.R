library(EnviroPRA)


### Name: EnviroPRA-package
### Title: Environmental Probabilistic Risk Assessment Tools
### Aliases: EnviroPRA-package EnviroPRA
### Keywords: package

### ** Examples


#### Performs Deterministic Environmental Risk Assessment #####

# Example of dermal contact with a chemical in swiming water

# Estimate the dermal absorbed dose during swiming in waters with a carcinogenic chemical
# (water concentration of 250 mg/m^3)

DWIR ( CW = 250)

# For a systemic effect:

DWIR ( CW= 250, AT=24*365)

# Specifying all the parameters for the carcinogenic case

I = DWIR ( CW=250, IR=1.5, EF = 300, ED = 24, BW = 85)

# Chemical Slope factor

SFAs = 1.5

# Dermal Absorption Factor

ABSAs = 3e-02

# Gastrointestinal Absorption Factor

GIAs = 1

# Risk Estimation

RISKdermal (AD = I, SF = SFAs, GI = GIAs)

#### Perform a test to assess the fitness of a theorical distribution to empirical data ####

set.seed(123)

a <- rnorm(n=100, mean =1.5, sd = 0.25)

b <- rnorm(n = 15, mean = 300, sd = 15)

fit_dist_test(a)

fit_dist_test(b)

# Graphical representation of data fitting to a distribution

plot_fit_dist(a, "norm")

plot_fit_dist(b, "norm")

####  Perform a Probabilistic Environmental Risk Assessment #### 

Fita <- Fit_dist_parameter(a)

Fitb <- Fit_dist_parameter(b)

IRr <-random_number_generator(n = 10000, Fited = Fita, 
                            dist = "norm", a =0.8, b = 2.1)
                            
EFr <-random_number_generator(n = 10000, Fited = Fitb, 
                            dist = "norm", a =250, b = 330)
                            
I = DWIR ( CW=250, IR=IRr, EF = EFr, ED = 24, BW = 85)

# Risk Estimation

Risk <- RISKdermal (AD = I, SF = SFAs, GI = GIAs)

hist (Risk)

quantile (Risk, c (0.05, 0.25, 0.5, 0.75, 0.95))




