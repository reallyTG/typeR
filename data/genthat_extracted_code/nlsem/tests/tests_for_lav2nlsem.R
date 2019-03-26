# ===================
# Tests for lav2nlsem
# ===================

library(nlsem)

# ordinary lms
# ============
lms_model <- '
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta1 =~ y1 + y2 + y3
  eta2 =~ y4 + y5 + y6

  eta1 ~ xi2 + xi1:xi2
  eta2 ~ xi1 + eta1
'

lav2nlsem(lms_model)

# ordinary lms with different inputs for interaction
# ==================================================
# "none"
# --
lms_model <- '
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2
'

lav2nlsem(lms_model)

# not all interactions with xi defined
# ------------------------------------
lms_model <- '
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  xi3 =~ x7 + x8 + x9
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi1 + xi1:xi2
'

lav2nlsem(lms_model)

# semm model
# ===========
semm_model <- specify_sem(num.x=6, num.y=3, num.xi=2, num.eta=1,
                         xi="x1-x3,x4-x6", eta="y1-y3", num.classes=2,
                         interaction="none")

lav_model <- '
  class: 1
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2

  class: 2
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2
'

lav_semm_model <- lav2nlsem(lav_model)

# identical(semm_model, lav_semm_model)

# nsemm model
# ===========
lav_model <- '
  class: 1
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi2

  class: 2
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi2

  class: 3
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi1
'

nsemm_model <- lav2nlsem(lav_model, constraints="direct1")

## with restrictions
# nsemm model
# ===========
lav_model2 <- '
  class: 1
  xi1 =~ NA*x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi2

  class: 2
  xi1 =~ 0*x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi2

  class: 3
  xi1 =~ x1 + x2 + x3
  xi2 =~ x4 + 1*x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + 0*xi2 + xi1:xi1
'

nsemm_model2 <- lav2nlsem(lav_model2, constraints="direct1")
nsemm_model2$matrices

# with parameter labels (which should be ignored)
# ===========
lav_model <- '
  class: 1
  xi1 =~ t1*x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi2

  class: 2
  xi1 =~ t2*x1 + x2 + x3
  xi2 =~ x4 + x5 + x6
  eta =~ y1 + y2 + y3

  eta ~ xi1 + xi2 + xi1:xi2
'

model <- lav2nlsem(lav_model, constraints="direct1")
model$matrices

