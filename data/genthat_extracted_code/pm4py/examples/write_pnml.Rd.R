library(pm4py)


### Name: write_pnml
### Title: Write Petri net as PNML
### Aliases: write_pnml

### ** Examples

# don't test automatically since this writes a file
## No test: 
if (pm4py_available()) {
  library(eventdataR)
  data(patients)

  # As Inductive Miner of PM4PY is not life-cycle aware, keep only `complete` events:
  patients_completes <- patients[patients$registration_type == "complete", ]

  net <- discovery_inductive(patients_completes)
  write_pnml(net$petrinet,
             "test.pnml",
             net$initial_marking,
             net$final_marking)
}
## End(No test)




