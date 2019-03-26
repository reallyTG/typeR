library(broom)


### Name: tidy.felm
### Title: Tidy a(n) felm object
### Aliases: tidy.felm felm_tidiers lfe_tidiers

### ** Examples


if (require("lfe", quietly = TRUE)) {

    library(lfe)
    
    N=1e2
    DT <- data.frame(
      id = sample(5, N, TRUE),
      v1 =  sample(5, N, TRUE),
      v2 =  sample(1e6, N, TRUE),
      v3 =  sample(round(runif(100,max=100),4), N, TRUE),
      v4 =  sample(round(runif(100,max=100),4), N, TRUE)
    )

    result_felm <- felm(v2~v3, DT)
    tidy(result_felm)
    augment(result_felm)
    result_felm <- felm(v2~v3|id+v1, DT)
    tidy(result_felm, fe = TRUE)
    augment(result_felm)
    v1<-DT$v1
    v2 <- DT$v2
    v3 <- DT$v3
    id <- DT$id
    result_felm <- felm(v2~v3|id+v1)
    tidy(result_felm)
    augment(result_felm)
    glance(result_felm)
}




