library(gsw)


### Name: gsw_CT_from_t
### Title: Convert from temperature to conservative temperature
### Aliases: gsw_CT_from_t

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <-  c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
CT <- gsw_CT_from_t(SA, t, p)
expect_equal(CT, c(28.809919826700281, 28.439227816091140, 22.786176893078498,
                   10.226189266620782, 6.827213633479988, 4.323575748610455))



