library(broom)


### Name: tidy.plm
### Title: Tidy a(n) plm object
### Aliases: tidy.plm plm_tidiers

### ** Examples


library(plm)

data("Produc", package = "plm")
zz <- plm(log(gsp) ~ log(pcap) + log(pc) + log(emp) + unemp,
          data = Produc, index = c("state","year"))

summary(zz)

tidy(zz)
tidy(zz, conf.int = TRUE)
tidy(zz, conf.int = TRUE, conf.level = .9)

augment(zz)
glance(zz)




