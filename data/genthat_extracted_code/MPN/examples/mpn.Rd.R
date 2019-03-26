library(MPN)


### Name: mpn
### Title: Calculate most probable number
### Aliases: mpn
### Keywords: MPN

### ** Examples

# Compare MPN, 95% CI, and RI to Jarvis -------------------------------------

# Table 1
mpn(positive = c(3, 1, 1), tubes = c(3, 3, 3), amount = c(1, .1, .01))
  #Jarvis: 7.5 (1.9, 30) RI = .209

mpn(positive = c(2, 2, 0), tubes = c(3, 3, 3), amount = c(1, .1, .01))
  #Jarvis: 2.1 (0.71, 6.2), RI = .069

mpn(positive = c(0, 0, 0), tubes = c(3, 3, 3), amount = c(1, .1, .01))
  #Jarvis: 0 (0, 1.1) RI = 1
mpn(positive = c(0, 0, 0), tubes = c(3, 3, 3), amount = c(1, .1, .01),
    conf_level = .975)$UB  #alpha / 2

mpn(positive = c(3, 3, 3), tubes = c(3, 3, 3), amount = c(1, .1, .01))
  #Jarvis: Inf (36, Inf) RI = 1
mpn(positive = c(3, 3, 3), tubes = c(3, 3, 3), amount = c(1, .1, .01),
    conf_level = .975)$LB  #alpha / 2

# Table 2
mpn(positive = c(20, 14, 3), tubes = c(20, 20, 20), amount = c(1, .1, .01))
  #Jarvis: 13 (7.6, 21) RI = 0.794

mpn(positive = c(50, 35, 7), tubes = c(50, 50, 50),
    amount = 2 * c(1, .1, .01))
  #Jarvis: 6.3 (4.5, 8.7) RI = .806

mpn(positive = c(0, 5, 1, 0), tubes = c(1, 10, 10, 10),
    amount = c(10, 1, .1, .01))
  #Jarvis: 0.33 (0.14, 0.74) RI = .004

mpn(positive = c(1, 5, 3, 1, 1), tubes = c(1, 5, 5, 5, 5),
    amount = c(5, 1, .5, .1, .05))
  #Jarvis: 2.7 (1.3, 5.5) RI = .512

# Compare MPN and 95% CI to BAM tables --------------------------------------

# Table 1
mpn(positive = c(0, 0, 0), tubes = c(3, 3, 3), amount = c(.1, .01, .001))
  #BAM: <3.0 (-, 9.5)

mpn(positive = c(0, 0, 1), tubes = c(3, 3, 3), amount = c(.1, .01, .001))
  #BAM: 3.0 (0.15, 9.6)

mpn(positive = c(2, 2, 0), tubes = c(3, 3, 3), amount = c(.1, .01, .001))
  #BAM: 21 (4.5, 42)

mpn(positive = c(3, 3, 3), tubes = c(3, 3, 3), amount = c(.1, .01, .001))
  #BAM: >1100 (420, -)
mpn(positive = c(3, 3, 2), tubes = c(3, 3, 3), amount = c(.1, .01, .001))$MPN


# Table 2
mpn(positive = c(0, 0, 0), tubes = c(5, 5, 5), amount = c(.1, .01, .001))
  #BAM: <1.8 (-, 6.8)
mpn(positive = c(0, 0, 1), tubes = c(5, 5, 5), amount = c(.1, .01, .001))$MPN

mpn(positive = c(4, 0, 2), tubes = c(5, 5, 5), amount = c(.1, .01, .001))
  #BAM: 21 (6.8, 40)

mpn(positive = c(5, 5, 5), tubes = c(5, 5, 5), amount = c(.1, .01, .001))
  #BAM: >1600 (700, -)
mpn(positive = c(5, 5, 4), tubes = c(5, 5, 5), amount = c(.1, .01, .001))$MPN




