library(pm4py)


### Name: petrinet_synchronous_product
### Title: Synchronous product Petri net
### Aliases: petrinet_synchronous_product

### ** Examples

if (pm4py_available()) {
  library(eventdataR)
  data(patients)

  # As Inductive Miner of PM4PY is not life-cycle aware, keep only `complete` events:
  patients_completes <- patients[patients$registration_type == "complete", ]

  net <- discovery_inductive(patients_completes)
  petrinet_synchronous_product(net$petrinet,
                               net$initial_marking,
                               net$final_marking,
                               net$petrinet,
                               net$initial_marking,
                               net$final_marking)
}




