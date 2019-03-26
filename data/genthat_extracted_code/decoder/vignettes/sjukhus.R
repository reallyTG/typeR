## ---- echo = FALSE, message=FALSE----------------------------------------
library(decoder)
suppressPackageStartupMessages(library(dplyr))

rc <- 
  decoder:::sjukhus_rc %>% 
  mutate(
    value = decode(value, "sjukhus_rc_code2klartext")
  )
  
sjukhus_all <- 
  dplyr::bind_rows(
    rockan = decoder:::sjukhus,
    inca   = decoder:::sjukhus_inca,
    par    = decoder:::sjukhus_par,
    rc     = rc,
    .id    = "source"
)

key_n_sources <- 
  sjukhus_all %>% 
  count(key, sort = TRUE)

## ---- echo = FALSE, message = FALSE--------------------------------------
in4 <- key_n_sources %>% filter(n == 4)

sjukhus_all %>% 
  inner_join(in4) %>% 
  arrange(key) %>% 
  tidyr::spread(source, value) %>% 
  select(-n) %>% 
  knitr::kable()

## ---- echo = FALSE, message = FALSE--------------------------------------
sjukhus_most <- 
  dplyr::bind_rows(
    rockan = decoder:::sjukhus,
    inca   = decoder:::sjukhus_inca,
    par    = decoder:::sjukhus_par,
    .id    = "source"
)

key_n_sources <- 
  sjukhus_most %>% 
  count(key, sort = TRUE)
in3 <- key_n_sources %>% filter(n == 3)

sjukhus_most %>% 
  filter(source != "rc") %>% 
  inner_join(in3) %>% 
  arrange(key) %>% 
  tidyr::spread(source, value) %>% 
  select(-n) %>% 
  DT::datatable()

## ---- echo = FALSE, message = FALSE--------------------------------------
decoder:::sjukhus %>% 
anti_join(decoder:::sjukhus_inca) %>% 
  DT::datatable()


## ---- echo = FALSE, message=FALSE----------------------------------------
decoder:::sjukhus_inca %>% 
anti_join(decoder:::sjukhus) %>% 
  DT::datatable()


