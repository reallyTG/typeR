## ------------------------------------------------------------------------
df <- 
  data.frame(
    sjukhus          = c("51012", "53011", "53013", "52011", "50070"),
    something        = sample(letters, 5),
    something_else   = sample(LETTERS, 5),
    stringsAsFactors = FALSE
  )
knitr::kable(df)

## ------------------------------------------------------------------------
# Vi använder också dplyr för data managemant
suppressPackageStartupMessages(library(dplyr))
library(decoder)

df %>% 
  mutate(
    sjukhus_rc     = decode(sjukhus, "sjukhus_rc"),
    forvaltning_rc = decode(sjukhus, "forvaltning_rc")
  ) %>% 
  knitr::kable()

## ------------------------------------------------------------------------
df %>% 
  mutate(
    sjukhus_rc_kod  = decode(sjukhus, "sjukhus_rc"),
    forv_rc_kod     = decode(sjukhus, "forvaltning_rc"),
    sjukhus_rc_namn = decode(sjukhus, "sjukhus_rc", "sjukhus_rc_namn"),
    forv_rc_namn    = decode(sjukhus, "forvaltning_rc", "forvaltning_rc_namn")
  ) %>% 
  knitr::kable()

## ---- eval = FALSE-------------------------------------------------------
#  df %>%
#    mutate(
#      sjukhus_rc_kod      = decode(sjukhus, "sjukhus_rc"),
#      forvaltning_rc_kod  = decode(sjukhus, "forvaltning_rc"),
#      sjukhus_rc_namn     = decode(sjukhus_rc_kod, "sjukhus_rc_code2klartext"),
#      forvaltning_rc_namn = decode(forvaltning_rc_kod, "forvaltning_rc_code2klartext")
#    )

## ------------------------------------------------------------------------
decode(decode(df$sjukhus, "sjukhus_rc"), "sjukhus_rc_code2klartext")

## ------------------------------------------------------------------------
sjukhusnamn <- 
  data_frame(
    rcc_sjukhus_kod = decoder:::sjukhus_rc$key,
    rcc_sjukhus_namn = decode(rcc_sjukhus_kod, "sjukhus"),
    sjukhus_rc_namn = decode(rcc_sjukhus_kod, "sjukhus_rc", "sjukhus_rc_namn")
  ) 

knitr::kable(sjukhusnamn)

