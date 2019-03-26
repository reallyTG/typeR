## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----CAPTION, echo=F, fig.align='center', fig.caption = T, fig.cap = "The classical representation of the Theory of Island Biogeography. Islands further from the mainland receive less species than closer ones, and there are more extinctions on small islands than on the large ones. The number of species at equilibrium corresponds to the point where colonization equals extinction.", fig.height=4.5, fig.width=6----
plot(seq(0, 20, by = 2), type = "l", lty = 2, xlab = "Number of species", ylab = "Colonizations or Extinctions", col = "turquoise")
lines(seq(0, 8, by = .8), col = "turquoise")
lines(seq(8, 0, by = -.8), col = "coral")
lines(seq(18, 0, by = -1.8), lty = 2, col = "coral")
text(x = 2, y = 8, "far")
text(x = 3, y = 16, "near")
text(x = 9, y = 8, "large")
text(x = 8, y = 16, "small")

## ---- echo = F-----------------------------------------------------------
library(island)
data(alonso15)
knitr::kable(head(alonso15[[2]]))

## ---- echo = F-----------------------------------------------------------
library(island)
data(simberloff)
knitr::kable(head(simberloff[[2]][, -(6:14)]))

## ---- echo = F-----------------------------------------------------------
set.seed(10110111)
df <- data.frame(Sp. = LETTERS[1:10], "1" = sample(c(0,1), 10, replace = T, prob = c(.6, .4)), "2" = sample(c(0,1), 10, replace = T, prob = c(.7, .3)), "3" = sample(c(0,1), 10, replace = T, prob = c(.7, .3)))
colnames(df)[2:4] <- 1:3
knitr::kable(df)

## ------------------------------------------------------------------------
### LIKELIHOOD
0.4^3 * 0.6^4 * 0.7^10 * 0.3^3
# This is a pretty small likelihood. We can easily transform this likelihood into log-likelihood.

### LOG-LIKELIHOOD
3 * log(0.4) + 4 * log(0.6) + 10 * log(0.7) + 3 * log(0.3)
# This is the log-likelihood associated with the given set of transition probabilities. Notice that we obtain the same value with both approaches.
log(0.4^3 * 0.6^4 * 0.7^10 * 0.3^3)

## ------------------------------------------------------------------------
c_and_e <- regular_sampling_scheme(x = df, vector = 2:4)
c_and_e

## ------------------------------------------------------------------------
cetotrans(c = c_and_e[1], e = c_and_e[4])

## ------------------------------------------------------------------------
data("alonso15")
df <- alonso15[[2]]
knitr::kable(head(df))

## ------------------------------------------------------------------------
rates <- regular_sampling_scheme(x = df, vector = 3:6)
rates

## ------------------------------------------------------------------------
rates_g <- regular_sampling_scheme(x = df, vector = 3:6, level = "Guild", n = 5)
rates_g

## ----confidence intervals------------------------------------------------
rates2a <- regular_sampling_scheme(x = df, vector = 3:6, CI = T)
rates2a

# Sequential method
rates2b <- regular_sampling_scheme(x = df, vector = 3:6, level = "Guild", n = 1, step = 0.005, CI = T)
knitr::kable(rates2b)

# Hessian-based method
rates2c <- regular_sampling_scheme(x = df, vector = 3:6, level = "Guild", n = 1, CI = T)
knitr::kable(rates2c)

## ----likelihood profile, fig.align = 'center', fig.height = 5, fig.width = 7, fig.caption = T, fig.cap = "Likelihood profile for the colonization rate in Kadmat atoll. The cross in magenta indicates the m.l.e. for the rate."----
rates

seqs <- seq.int(5, 200, by = 5) / 100
NLLs <- NLL_rss(x = df, vector = 3:6, c = seqs * rates$c, e = rates$e)
plot(seqs * rates$c, NLLs, type = "l", xlab = "Colonization rate (year⁻¹)", ylab = "Negative Log-Likelihood", main = "Likelihood profile")
points(rates$c, rates$NLL, pch = 4, col = "magenta")

## ----model selection-----------------------------------------------------
guild_NLL <- sum(rates2c$NLL)
guild_NLL
comm_NLL <- rates$NLL
comm_NLL

aic_g <- akaikeic(NLL = guild_NLL, k = 14)
aic_c <- akaikeic(NLL = comm_NLL, k = 2)
aic_g
aic_c

ms_kadmat <- data.frame(Model = c("Guilds", "Community"), AIC = c(aic_g, aic_c))
weight_of_evidence(data = ms_kadmat)

## ----Simulation Kadmat---------------------------------------------------
### First, take a look at the rates for Kadmat
tp <- cetotrans(c = rates$c, e = rates$e)

set.seed(10110111)
sim_1 <- PA_simulation(x = df, column = 3, transitions = tp, times = 11)
colSums(sim_1)

sims <- data_generation(x = df, column = 3, transitions = tp, iter = 999, times = 11)
sims[, 1]

ic <- apply(X = sims, MARGIN = 1, FUN = quantile, c(0.025, 0.975))
ic
rates 

## ---- echo = F, fig.align='center', fig.height=4.5, fig.width=6, fig.caption = T, fig.cap = "Temporal evolution in Kadmat atoll. The points connected with lines indicate the observed species richness, while the red dashed line indicates the 95% distribution of simulations. The dotted black line corresponds to one stochastic simulation of the colonization and extinction dynamics on the atoll."----
plot(c(2000:2003, 2010, 2011), colSums(df[, 3:8]), type = "b", xlab = "Year", ylab = "Species richness", main = "Kadmat")
lines(2001:2011, colSums(sim_1), lty = "dotted")
lines(2001:2011, ic[1, ], col = "red", lty = 2)
lines(2001:2011, ic[2, ], col = "red", lty = 2)


## ----Model error---------------------------------------------------------
simulated <- apply(sims, 1, quantile, 0.5)
simulated 

simulated <- simulated[c(1:3, 10, 11)]

observed <- colSums(df[, 3:8])
observed

# We skip the first observation since we have to use it as the starting point of the simulations.
observed <- observed[-1] 

r_squared(observed = observed, simulated = simulated, sp = 156)


## ---- echo = F-----------------------------------------------------------
knitr::kable(head(simberloff[[6]][, -(6:13)]))

## ----Single parameters, fig.align = 'center', fig.height = 4.5, fig.width = 6, fig.caption = T, fig.cap = "Colonization and extinction rates for the whole invertebrate community or selected taxonomic groups in island ST2."----
st2 <- simberloff[[6]]

# Before we begin, it is useful to look at the data for obvious errors.
head(st2) 

# Presence-absence data is in columns 3 to 16.
rates.st2 <- irregular_single_dataset(dataframe = st2, vector = 3:16, c = 0.001, e = 0.001, assembly = T, jacobian = T)
rates.st2

# We will now estimate rates for different groups in "Tax. Unit 1" with more than 5 species.
rates.groups <- irregular_single_dataset(dataframe = st2, vector = 3:16, c = 0.001, e = 0.001, column = "Tax. Unit 1", n = 5, assembly = T, jacobian = T)
rates.groups

# Plotting the results.
plot(rates.groups[, 2], rates.groups[, 5], xlab = "Colonization rate (day⁻¹)", ylab = "Extinction rate (day⁻¹)", main = "ST2")
points(rates.st2[, 1], rates.st2[, 4], pch = 4)                        
loc <- list(x = c(0.004902829, 0.008421634, 0.006021524, 0.007679227, 0.007892796, 0.008025005, 0.006692741), y = c(0.008578302, 0.017145964, 0.014431104, 0.009668973, 0.011560750, 0.016878929, 0.011553715))

text(loc, c(substr(rates.groups[, 1], 1, 3), "Whole \ncommunity"))


## ----ST2 richness, fig.align = 'center', fig.height = 4.5, fig.width = 6, fig.caption = T, fig.cap = "Temporal evolution on island ST2. The points connected with lines indicate the observed species richness, while the red dashed line indicates the 95% of the distribution of simulations, and the green dashed line the median richness for 300 simulations."----
dts <- as.numeric(colnames(st2)[4:16]) - as.numeric(colnames(st2)[3:15])
dts <- c(21, dts)

tps <- cetotrans(c = rep(rates.st2[[1]], length(dts)), e = rep(rates.st2[[4]], length(dts)), dt = dts)
tps

sims <- data_generation(x = matrix(0, 80, 1), column = 1, transitions = tps, iter = 300, times = length(dts))
ic <- apply(sims, 1, quantile, probs = c(0.025, 0.975))
ic

med.st2 <- apply(sims, 1, median)

days <- c(0, colnames(st2)[3:16]) 

plot(days, c(0, colSums(st2[, 3:16])), ylim = c(0, 40), xlab = "Days since defaunation", ylab = "Species richness", main = "ST2", type = "b")
lines(days, c(0, med.st2), col = "green", lty = 2)
lines(days, c(0, ic[1, ]), col = "magenta", lty = 3)
lines(days, c(0, ic[2, ]), col = "magenta", lty = 3)

## ---- fig.align='center', fig.height=5, fig.width=7, fig.caption = T, fig.cap = "Colonization and extinction rates for the data from Simberloff (1969) on experimental island zoogeography. In green, some of the groups studied, in magenta the different islands."----
rates.simberloff <- irregular_multiple_datasets(list = simberloff, vectorlist = list(3:17, 3:18, 3:17, 3:19, 3:17, 3:16), c = 0.001, e = 0.001, jacobian = T)
rates.islands <- irregular_multiple_datasets(list = simberloff, vectorlist = list(3:17, 3:18, 3:17, 3:19, 3:17, 3:16), c = 0.001, e = 0.001, column = "Island", n = 5, jacobian = T)
rates.taxonomy <- irregular_multiple_datasets(list = simberloff, vectorlist = list(3:17, 3:18, 3:17, 3:19, 3:17, 3:16), c = 0.0001, e = 0.0001, column = "Tax. Unit 1", n = 20, jacobian = T)
rates.simberloff
rates.islands
rates.taxonomy

plot(rates.taxonomy[, 2], rates.taxonomy[, 5], xlim = c(.0034, .0074), ylim = c(.0025, .0225), pch = 20, main = "Simberloff dataset", xlab = "Colonization rate (day⁻¹)", ylab = "Extinction rate (day⁻¹)")
points(rates.islands[, 2], rates.islands[, 5], pch = 4)
points(rates.simberloff[, 1], rates.simberloff[, 4], pch = 3)

locs <- list(x = c(0.005136858, 0.003858476, 0.005435459, 0.005724728, 0.004026439, 0.005379471, 0.006919129, 0.005015552, 0.005594090, 0.004912908, 0.006303266, 0.004722939, 0.006069984, 0.005435459, 0.005892691), y = c(0.01074532, 0.007403081, 0.014011605, 0.010289563, 0.012644324, 0.010593403, 0.011353003, 0.009985722, 0.017429807, 0.012872204, 0.018645168, 0.011201083, 0.006415600, 0.004212758, 0.015454846))
text(locs, c("TIB", as.character(rates.islands$Group), substr(rates.taxonomy[, 1], 1, 3)), 
     col = c("black", rep("magenta", 6), rep("green", 8)))


## ----alonso15 model selection--------------------------------------------
data(alonso15)
head(alonso15[[2]]) # Examine the data

# To begin, we calculate rates for each island (model B), and for each group in each island (model D).
rates.aga <- regular_sampling_scheme(x = alonso15[[1]], vector = 3:6)
rates.kad <- regular_sampling_scheme(x = alonso15[[2]], vector = 3:6)
rates.kav <- regular_sampling_scheme(x = alonso15[[3]], vector = 3:5)

ModelB <- rates.aga$NLL + rates.kad$NLL + rates.kav$NLL 


rates.aga.guild <- regular_sampling_scheme(x = alonso15[[1]], vector = 3:6, level = "Guild", n = 1)
rates.kad.guild <- regular_sampling_scheme(x = alonso15[[2]], vector = 3:6, level = "Guild", n = 1)
rates.kav.guild <- regular_sampling_scheme(x = alonso15[[3]], vector = 3:5, level = "Guild", n = 1)

ModelD <- sum(rates.aga.guild$NLL) + sum(rates.kad.guild$NLL) + sum(rates.kav.guild$NLL)

# Next, we calculate rates using the function irregular_multiple_datasets. We need to first change the colnames of the columns with data.

colnames(alonso15[[1]])[3:6] <- 2000:2003
colnames(alonso15[[2]])[3:6] <- 2000:2003
colnames(alonso15[[3]])[3:5] <- 2001:2003

rates.lak <- irregular_multiple_datasets(list = alonso15, vectorlist = list(3:6, 3:6, 3:5), c = 0.1, e = 0.1, jacobian = T, CI = T)

rates.guild <- irregular_multiple_datasets(list = alonso15, vectorlist = list(3:6, 3:6, 3:5), c = 0.1, e = 0.1, jacobian = T, column = "Guild", n = 1, CI = T)

# We can now follow the model selection procedure used in the article.
ModelA <- rates.lak$NLL
ModelC <- sum(rates.guild$NLL)

NLL <- c(ModelA, ModelB, ModelC, ModelD)
NLL

Parameters <- c(2, 6, 14, 42)
N <- rep(1248, 4)

AIC <- akaikeic(NLL = NLL, k = Parameters)
AICc <- akaikeicc(NLL = NLL, k = Parameters, n = 1248)

Table1 <- weight_of_evidence(data = data.frame(Model = c("A", "B", "C", "D"), AICc = AICc))
Table1 <- cbind(Table1, AIC, AICc, NLL, Parameters, N)
knitr::kable(Table1)


## ----alonso15 rates, fig.height=5, fig.width=7, fig.caption = T, fig.cap = "Colonization and extinction probabilities by guild within the coral reef fish community in the Lakshadweep Archipelago, India. Algal Feeders (A), Omnivores (O), Corallivores (C), Zooplanktivores (Z), Micro-invertivores (m), Macro-invertivores (M), and Piscivores (P)."----
# The following steps are used to reproduce Figure 3 in Alonso *et al* (2015).
rates.guild

# transform rates into transition probabilities.
tps <- cetotrans(c = rates.guild$c, e = rates.guild$e)

plot(tps[, 2], tps[, 1], xlim = c(0, 0.7), ylim = c(0, 0.5), type = "n", xlab = "Colonization probability", ylab = "Extinction probability", main = "Lakshadweep guilds")
text(tps[, 2], tps[, 1], c("A", "C", "M", "m", "O", "P", "Z"))
text(0.07, 0.25, "Trophic level", srt = 90, col = "magenta")
arrows(0.1, 0.1, 0.1, 0.4, code = 2, col = "green")

## ----alonso15 sim, fig.height=5, fig.width=7, fig.caption = T, fig.cap = "Temporal evolution of species richness of corallivores in Agatti atoll, according to model D. In red, the observed species richness, while the black dashed lines represent 95% of the distribution of 300 simulations with the estimated dynamics."----
rates.aga.guild

tps <- cetotrans(c = rates.aga.guild[2, 2], e = rates.aga.guild[2, 5])

cor.agatti <- alonso15[[1]][alonso15[[1]]$Guild == "Corallivore", ]
richness <- colSums(cor.agatti[, 3:8])
richness

sims <- data_generation(x = cor.agatti, column = 3, transitions = tps, iter = 300, times = 11)
sims.ic <- apply(X = sims, MARGIN = 1, FUN = quantile, probs = c(0.025, 0.975))

plot(c(2000:2003, 2010, 2011), richness, type = "b", ylim = c(0, 21), col = "red", xlab = "Time (Year)", ylab = "Species", main = "Corallivore/AGATTI")
lines(c(2000:2011), c(7, sims.ic[1, ]), lty = 2)
lines(c(2000:2011), c(7, sims.ic[2, ]), lty = 2)


## ----environmental fit, warning = F--------------------------------------
data(idaho)
df <- idaho[[1]]
env <- idaho[[2]]

# Examine the colnames.
colnames(df)
colnames(env)

# Estimate the influence of temperature and precipitation on colonization and extinction dynamics. We first include the call to all_environmental_fit but we do not run it because of computation limits. We then use the greedy algorithm to find a good dependency.

envfit <- greedy_environmental_fit(dataset = df, vector = 3:23, env = c("env$TOTAL.ppt", "env$ANNUAL.temp"), c = 0.13, e = 0.19, aic = 100000)
envfit

all_environmental_fit(dataset = df, vector = 3:23, env = c("env$TOTAL.ppt", "env$ANNUAL.temp"), c = 0.13, e = 0.19, aic = 100000) 


## ----custom and calculator, warning = F,  fig.align='center', fig.height=5, fig.width=7, fig.caption = T, fig.cap = "Temporal evolution of species richness in a plant community. The points connected with lines indicate the observed species richness, while the red dashed line indicates the 95% of the distribution of simulations, and the green dashed line the median richness for 300 simulations."----
custom_environmental_fit(dataset = df, vector = 3:23, params = envfit$Results$par, c_expression = envfit$Colonization, e_expression = envfit$Extinction)

rates.env <- rates_calculator(params = envfit$Results$par, c_expression =  envfit$Colonization, e_expression = envfit$Extinction, t = 21)
head(rates.env)

dts <- as.numeric(colnames(df)[4:23]) - as.numeric(colnames(df)[3:22])
dts

tps <- cetotrans(c = rates.env[-21, 1], e = rates.env[-21, 2], dt = dts)
sims <- data_generation(x = df, column = 3, transitions = tps, iter = 100, times = 20)
sims.ic <- apply(sims, 1, quantile, probs = c(0.025, 0.975))
med.ida <- apply(sims, 1, quantile, probs = .5)
sims.ic

days <- 1900 + as.numeric(colnames(df)[3:23])


plot(days, colSums(df[, 3:23]), type = "b", ylim = c(50, 115), pch = 4, ylab = "Accumulated species richness", xlab = "Year", main = "Sagebrush steppe Dubois, ID, USA")
lines(days, c(57, sims.ic[1, ]), col = "magenta", lty = 3)
lines(days, c(57, sims.ic[2, ]), col = "magenta", lty = 3)
lines(days, c(57, med.ida), col = "green", lty = 2)



