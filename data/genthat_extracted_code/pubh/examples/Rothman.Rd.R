library(pubh)


### Name: Rothman
### Title: Oral contraceptives and stroke.
### Aliases: Rothman
### Keywords: datasets

### ** Examples

data(Rothman)
mhor(stroke ~ ht/oc, data = Rothman)

## Model with standard interaction term:
model1 <- glm(stroke ~ ht*oc, data = Rothman, family = binomial)
glm_coef(model1)

## Model considering join exposure:
Rothman$join <- 0
Rothman$join[Rothman$oc == "Non-user" & Rothman$ht == "Yes"] <- 1
Rothman$join[Rothman$oc == "User" & Rothman$ht == "No"] <- 2
Rothman$join[Rothman$oc == "User" & Rothman$ht == "Yes"] <- 3
Rothman$join <- factor(Rothman$join, labels=c("Unexposed", "Hypertension", "OC user",
                       "OC and hypertension"))
with(Rothman, table(join))

model2 <- glm(stroke ~ join, data = Rothman, family = binomial)
glm_coef(model2)
odds_trend(stroke ~ join, data = Rothman)



