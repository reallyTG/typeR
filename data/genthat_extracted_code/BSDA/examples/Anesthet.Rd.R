library(BSDA)


### Name: Anesthet
### Title: Recovery times for anesthetized patients
### Aliases: Anesthet
### Keywords: datasets

### ** Examples


qqnorm(Anesthet$recover)
qqline(Anesthet$recover)
with(data = Anesthet,
t.test(recover, conf.level = 0.90)$conf
)




