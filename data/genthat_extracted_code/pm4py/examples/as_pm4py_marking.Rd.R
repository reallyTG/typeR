library(pm4py)


### Name: as_pm4py_marking
### Title: Convert to a PM4Py marking
### Aliases: as_pm4py_marking

### ** Examples

if (pm4py_available()) {
  library(eventdataR)
  data(patients)

  # As Inductive Miner of PM4PY is not life-cycle aware, keep only `complete` events:
  patients_completes <- patients[patients$registration_type == "complete", ]

  net <- discovery_inductive(patients_completes)
  as_pm4py_marking(c("sink"), r_to_py(net$petrinet))
}




