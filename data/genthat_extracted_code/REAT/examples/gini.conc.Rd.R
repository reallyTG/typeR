library(REAT)


### Name: gini.conc
### Title: Gini coefficient of spatial industry concentration
### Aliases: gini.conc

### ** Examples

# Example from Farhauer/Kroell (2013):
E_ij <- c(500,500,1000,7000,1000)
# employment of the industry in five regions
E_j <- c(20000,15000,20000,40000,5000)
# employment in the five regions
gini.conc (E_ij, E_j)
# Returns the Gini coefficient of industry concentration (0.4068966)

data(G.regions.emp)
# Concentration of construction industry in Germany
# based on 16 German regions (Bundeslaender) for the year 2008
construction2008 <- G.regions.emp[(G.regions.emp$industry == "Baugewerbe (F)" | 
G.regions.emp$industry == "Insgesamt") & G.regions.emp$year == "2008",]
# only data for construction industry (Baugewerbe) and all-over (Insgesamt)
# for the 16 German regions in the year 2008
construction2008 <- construction2008[construction2008$region != "Insgesamt",]
# delete all-over data for all industries
gini.conc(construction2008[construction2008$industry=="Baugewerbe (F)",]$emp, 
construction2008[construction2008$industry=="Insgesamt",]$emp)

# Concentration of financial industry in Germany 2008 vs. 2014
# based on 16 German regions (Bundeslaender) for 2008 and 2014
finance2008 <- G.regions.emp[(G.regions.emp$industry == 
"Erbringung von Finanz- und Vers.leistungen (K)" | 
G.regions.emp$industry == "Insgesamt") & G.regions.emp$year == "2008",]
finance2008 <- finance2008[finance2008$region != "Insgesamt",]
# delete all-over data for all industries
gini.conc(finance2008[finance2008$industry == 
"Erbringung von Finanz- und Vers.leistungen (K)",]$emp, 
finance2008[finance2008$industry=="Insgesamt",]$emp)
finance2014 <- G.regions.emp[(G.regions.emp$industry == 
"Erbringung von Finanz- und Vers.leistungen (K)" | G.regions.emp$industry ==
"Insgesamt") & G.regions.emp$year == "2014",]
finance2014 <- finance2014[finance2014$region != "Insgesamt",]
# delete all-over data for all industries
gini.conc(finance2014[finance2014$industry == 
"Erbringung von Finanz- und Vers.leistungen (K)",]$emp, 
finance2014[finance2014$industry=="Insgesamt",]$emp)



