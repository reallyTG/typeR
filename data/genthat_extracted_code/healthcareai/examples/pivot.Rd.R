library(healthcareai)


### Name: pivot
### Title: Pivot multiple rows per observation to one row with multiple
###   columns
### Aliases: pivot

### ** Examples

meds <-
  tibble::tibble(
    patient_id = c("A", "A", "A", "B"),
    medication = c("zoloft", "asprin", "lipitor", "asprin"),
    pills_per_day = c(1, 8, 2, 4)
  )
meds

# Number of pills of each medication each patient gets:
pivot(
  d = meds,
  grain = patient_id,
  spread = medication,
  fill = pills_per_day,
  missing_fill = 0
)

bills <-
  tibble::tibble(
    patient_id = rep(c("A", "B"), each = 4),
    dept_id = rep(c("ED", "ICU"), times = 4),
    charge = runif(8, 0, 1e4),
    date = as.Date("2024-12-25") - sample(0:2, 8, TRUE)
  )
bills

# Total charges per patient x department:
pivot(bills, patient_id, dept_id, charge, sum)

# Count of charges per patient x day:
pivot(bills, patient_id, date)

# Can provide a custom function to fun, which will take fill as input.
# Get the difference between the greatest and smallest charge in each
# department for each patient and format it as currency.
pivot(d = bills,
      grain = patient_id,
      spread = dept_id,
      fill = charge,
      fun = function(x) paste0("$", round(max(x) - min(x), 2))
)



