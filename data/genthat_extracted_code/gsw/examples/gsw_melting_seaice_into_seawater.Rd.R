library(gsw)


### Name: gsw_melting_seaice_into_seawater
### Title: Calculate properties related to seaice melting in seawater
### Aliases: gsw_melting_seaice_into_seawater

### ** Examples

SA <- c(      34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(       4.7856,  2.4329,  1.8103,  1.2600,  0.6886,  0.4403)
p <- c(            10,      50,     125,     250,     600,    1000)
w_seaice <- c( 0.0560, 0.02513, 0.02159, 0.01210, 0.00943, 0.00751)
SA_seaice <- c(     5,     4.8,     3.5,     2.5,       1,     0.4)
t_seaice <- c(-4.7856, -4.4329, -3.8103, -4.2600, -3.8863, -3.4036)
r <- gsw_melting_seaice_into_seawater(SA, CT, p, w_seaice, SA_seaice, t_seaice)
expect_equal(r$SA_final, c(33.047939199999995, 34.135300604999998, 34.344962295999999,
                         34.455798880000003, 34.418463862000003, 34.474563675999995))
expect_equal(r$CT_final, c(-0.018822367305381, 0.345095540241769, 0.020418581143151,
                         0.242672380976922, -0.111078380121959, -0.197363471215418))



