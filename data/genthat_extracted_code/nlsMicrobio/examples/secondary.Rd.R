library(nlsMicrobio)


### Name: secondary
### Title: Secondary growth models
### Aliases: secondary cpm_T cpm_pH_4p cpm_pH_3p cpm_aw_3p cpm_aw_2p
###   cpm_T_pH_aw
### Keywords: models

### ** Examples


data(ross)

# Example for the cpm_T model

d1 <- subset(ross, author == "salter" & aw == 0.997, 
	select = c(T, sqrtmumax))
nls1 <- nls(cpm_T, d1, list(muopt = 1.7, Tmin = 4, Topt = 40, Tmax = 47))
plotfit(nls1, smooth = TRUE)
overview(nls1)

# Example for the cpm_pH_4p model

d2 <- subset(ross, author == "presser" & aw > 0.99, 
	select = c(pH, sqrtmumax))
nls2 <- nls(cpm_pH_4p, d2, list(muopt = 0.5, pHmin = 4, 
	pHopt = 6.5, pHmax = 9))
plotfit(nls2, smooth = TRUE)
overview(nls2)

# Example for the cpm_pH_3p model

d3 <- subset(ross, author == "presser" & aw == 0.997, 
	select = c(pH, sqrtmumax))
nls3 <- nls(cpm_pH_3p, d3, list(muopt = 0.5, pHmin = 4, pHopt = 6.5))
plotfit(nls3, smooth = TRUE)
overview(nls3)

# Example for the cpm_aw_3p model

d4<-subset(ross, author == "mellefont", select = c(aw, sqrtmumax))
nls4 <- nls(cpm_aw_3p, d4, list(muopt = 0.6, awmin = 0.95, awopt = 0.995))
plotfit(nls4, smooth = TRUE)
overview(nls4)

# Example for the cpm_aw_2p model

d5 <- subset(ross, author == "mellefont" & aw < 0.99, 
	select = c(aw, sqrtmumax))
nls5 <- nls(cpm_aw_2p, d5, list(muopt = 0.6, awmin = 0.95))
plotfit(nls5, smooth = TRUE)
overview(nls5)


# Examples for the cpm_T_pH_aw model

d6 <- subset(ross, select = c(T, pH, aw, sqrtmumax))
nls6 <- nls(cpm_T_pH_aw, d6, list(muopt = 2, Tmin = 4, Topt = 40, Tmax = 49, 
	pHmin = 4, pHopt = 6.5, pHmax = 9, awmin = 0.95, awopt = 0.995))
def.par <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
plotfit(nls6, variable = 1)
plotfit(nls6, variable = 2)
plotfit(nls6, variable = 3)
overview(nls6)
par(def.par)



