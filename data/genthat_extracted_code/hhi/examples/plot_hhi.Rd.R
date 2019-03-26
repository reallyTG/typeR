library(hhi)


### Name: plot_hhi
### Title: Plots a Herfindahl-Hirschman Index Time Series
### Aliases: plot_hhi

### ** Examples

hhi <- c(45,60,50,100,94,15,88,200,215,68,
47,62,52,102,96,17,90,202,217,70)
year <- c(1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,
2000,2001,2002,2003,2004,2005,2006,2007,2008,2009)
data <- data.frame(hhi, year)
plot_hhi(data, "year", "hhi")



