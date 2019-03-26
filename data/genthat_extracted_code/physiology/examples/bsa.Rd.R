library(physiology)


### Name: bsa
### Title: Estimate body surface area
### Aliases: bsa bsa_adult bsa_dubois_dubois bsa_mosteller bsa_haycock
###   bsa_gehan_george bsa_boyd bsa_fujimoto bsa_takahira bsa_shuter_aslani
###   bsa_schlich

### ** Examples

bsa_dubois_dubois(2, 80)
bsa_dubois_dubois(1.5, 80)
stopifnot(
  identical(
    bsa_mosteller(1.5, 80),
    bsa_adult(1.5, 80)))



