## ----eval=FALSE----------------------------------------------------------
#  library(micar)
#  m <- mica.login(url="https://mica-demo.obiba.org")

## ----eval=FALSE----------------------------------------------------------
#  mica.networks(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))", locale="en", from=0, limit=10)

## ----eval=FALSE----------------------------------------------------------
#  mica.studies(m, query="study(in(Mica_study.methods-design,cohort_study))")

## ----eval=FALSE----------------------------------------------------------
#  mica.study.populations(m, query="study(in(Mica_study.methods-design,cohort_study))")
#  mica.study.dces(m, query="study(in(Mica_study.methods-design,cohort_study))")

## ----eval=FALSE----------------------------------------------------------
#  mica.datasets(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))")

## ----eval=FALSE----------------------------------------------------------
#  mica.variables(m, query="variable(in(Mlstr_area.Lifestyle_behaviours,Drugs))")

## ----eval=FALSE----------------------------------------------------------
#  mica.vocabularies(m, target="variable", query="cancer", locale = "en")

## ----eval=FALSE----------------------------------------------------------
#  mica.logout(m)

