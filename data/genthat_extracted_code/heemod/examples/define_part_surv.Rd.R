library(heemod)


### Name: define_part_surv
### Title: Define Partitioned Survival
### Aliases: define_part_surv define_part_surv_

### ** Examples

dist_pfs <- define_survival("exp", rate = 1)
dist_os <- define_survival("exp", rate = .5)

define_part_surv(
  pfs = dist_pfs,
  os = dist_os,
  state_names = c(
    progression_free = "A",
    progression = "B",
    terminal = "C",
    death = "D"
  )
)
# identical to:
define_part_surv(
  pfs = dist_pfs,
  os = dist_os,
  terminal_state = TRUE
)




