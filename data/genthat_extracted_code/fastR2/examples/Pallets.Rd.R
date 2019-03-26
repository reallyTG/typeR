library(fastR2)


### Name: Pallets
### Title: Pallet repair data
### Aliases: Pallets
### Keywords: datasets

### ** Examples


data(Pallets)
# Do the employees differ in the rate at which they repair pallets?
pal.lm1 <- lm(pallets ~ employee, data = Pallets) 
anova(pal.lm1)
# Now using day as a blocking variable
pal.lm2 <- lm(pallets ~ employee + day, data = Pallets) 
anova(pal.lm2)
gf_line(pallets ~ day, data = Pallets,
		group = ~employee,
		color = ~employee) %>%
  gf_point() %>%
  gf_labs(title = "Productivity by day and employee")




