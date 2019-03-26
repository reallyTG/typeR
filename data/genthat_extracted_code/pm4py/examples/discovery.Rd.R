library(pm4py)


### Name: discovery
### Title: Petri net discovery algorithms
### Aliases: discovery discovery_inductive variant_inductive_only_dfg
###   discovery_alpha variant_alpha_classic

### ** Examples

if (pm4py_available()) {
  library(eventdataR)
  data(patients)

  # As Inductive Miner of PM4PY is not life-cycle aware, keep only `complete` events:
  patients_completes <- patients[patients$registration_type == "complete", ]

  net <- discovery_inductive(patients_completes)

  # Show details of the obtained bupaR Petri net
  print(net$petrinet)

  # initial marking is a character vector
  print(net$initial_marking)

  # final marking is a character vector
  print(net$final_marking)

  # Petri net can be used with other bupaR functions
  petrinetR::render_PN(net$petrinet)

  # Keep an unconverted PM4PY Petri net for use in other PM4PY functions
  py_net <- discovery_inductive(patients_completes, convert = FALSE)
}




