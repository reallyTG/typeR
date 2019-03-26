doc <- "paper_diagram.bpmn"
doc_modified <- "paper_diagram_modified.bpmn"
repetition_log <- create_path_and_repetition_log(doc)
repetition_log_modified <- create_path_and_repetition_log(doc_modified)
doc_empty <- "paper_diagram_empty.bpmn"
repetition_log_empty <- create_path_and_repetition_log(doc_empty)
doc_event <- "paper_diagram_event.bpmn"
repetition_log_event <- create_path_and_repetition_log(doc_event)
doc_simple <- "paper_diagram_simple.bpmn"
repetition_log_simple <- create_path_and_repetition_log(doc_simple)

context("size")
test_that("size", {
  expect_equal(size_process_model(doc), 18)
  expect_equal(size_process_model(doc_modified), 21)
  expect_equal(size_process_model(doc_empty), 0)
  expect_equal(size_process_model(doc_event), 1)
  expect_equal(size_process_model(doc_simple), 4)
  expect_equal(number_events(create_internal_doc(doc)), 3)
  expect_equal(number_events(create_internal_doc(doc_modified)), 3)
  expect_equal(number_events(create_internal_doc(doc_empty)), 0)
  expect_equal(number_events(create_internal_doc(doc_event)), 1)
  expect_equal(number_events(create_internal_doc(doc_simple)), 2)
  expect_equal(number_AND_gateways(create_internal_doc(doc)), 2)
  expect_equal(number_AND_gateways(create_internal_doc(doc_modified)), 2)
  expect_equal(number_AND_gateways(create_internal_doc(doc_empty)), 0)
  expect_equal(number_AND_gateways(create_internal_doc(doc_event)), 0)
  expect_equal(number_AND_gateways(create_internal_doc(doc_simple)), 0)
  expect_equal(number_XOR_gateways(create_internal_doc(doc)), 3)
  expect_equal(number_XOR_gateways(create_internal_doc(doc_modified)), 5)
  expect_equal(number_XOR_gateways(create_internal_doc(doc_empty)), 0)
  expect_equal(number_XOR_gateways(create_internal_doc(doc_event)), 0)
  expect_equal(number_XOR_gateways(create_internal_doc(doc_simple)), 0)
  expect_equal(number_OR_gateways(create_internal_doc(doc)), 0)
  expect_equal(number_OR_gateways(create_internal_doc(doc_modified)), 0)
  expect_equal(number_OR_gateways(create_internal_doc(doc_empty)), 0)
  expect_equal(number_OR_gateways(create_internal_doc(doc_event)), 0)
  expect_equal(number_OR_gateways(create_internal_doc(doc_simple)), 0)
  expect_equal(number_complex_gateways(create_internal_doc(doc)), 0)
  expect_equal(number_complex_gateways(create_internal_doc(doc_modified)), 0)
  expect_equal(number_complex_gateways(create_internal_doc(doc_empty)), 0)
  expect_equal(number_complex_gateways(create_internal_doc(doc_event)), 0)
  expect_equal(number_complex_gateways(create_internal_doc(doc_simple)), 0)
  expect_equal(number_event_based_gateways(create_internal_doc(doc)), 0)
  expect_equal(number_event_based_gateways(create_internal_doc(doc_modified)), 0)
  expect_equal(number_event_based_gateways(create_internal_doc(doc_empty)), 0)
  expect_equal(number_event_based_gateways(create_internal_doc(doc_event)), 0)
  expect_equal(number_event_based_gateways(create_internal_doc(doc_simple)), 0)
})

context("data objects")
test_that("data objects", {
  expect_equal(n_data_objects(doc), 2)
  expect_equal(n_data_objects(doc_modified), 2)
  expect_equal(n_data_objects(doc_empty), 0)
  expect_equal(n_data_objects(doc_event), 0)
  expect_equal(n_data_objects(doc_simple), 0)
})

context("connectivity level between pools")
test_that("connectivity level between pools", {
  expect_equal(connectivity_level_between_pools(doc), 0.5)
  expect_equal(connectivity_level_between_pools(doc_modified), 0.5)
  expect_equal(connectivity_level_between_pools(doc_empty), 0)
  expect_equal(connectivity_level_between_pools(doc_event), 0)
  expect_equal(connectivity_level_between_pools(doc_simple), 0)
})

context("empty sequence flows")
test_that("empty sequence flows", {
  expect_equal(n_empty_sequence_flows(doc), 1)
  expect_equal(n_empty_sequence_flows(doc_modified), 1)
  expect_equal(n_empty_sequence_flows(doc_empty), 0)
  expect_equal(n_empty_sequence_flows(doc_event), 0)
  expect_equal(n_empty_sequence_flows(doc_simple), 0)
})

context("duplicate tasks")
test_that("duplicate tasks", {
  expect_equal(n_duplicate_tasks(doc), 3)
  expect_equal(n_duplicate_tasks(doc_modified), 3)
  expect_equal(n_duplicate_tasks(doc_empty), 0)
  expect_equal(n_duplicate_tasks(doc_event), 0)
  expect_equal(n_duplicate_tasks(doc_simple), 1)
})

context("pools")
test_that("pools", {
  expect_equal(n_pools(doc), 2)
  expect_equal(n_pools(doc_modified), 2)
  expect_equal(n_pools(doc_empty), 0)
  expect_equal(n_pools(doc_event), 0)
  expect_equal(n_pools(doc_simple), 0)
})

context("swimlanes")
test_that("swimlanes", {
  expect_equal(n_swimlanes(doc), 2)
  expect_equal(n_swimlanes(doc_modified), 2)
  expect_equal(n_swimlanes(doc_empty), 0)
  expect_equal(n_swimlanes(doc_event), 0)
  expect_equal(n_swimlanes(doc_simple), 0)
})

context("message flows")
test_that("message flows", {
  expect_equal(n_message_flows(doc), 1)
  expect_equal(n_message_flows(doc_modified), 1)
  expect_equal(n_message_flows(doc_empty), 0)
  expect_equal(n_message_flows(doc_event), 0)
  expect_equal(n_message_flows(doc_simple), 0)
})

context("density")
test_that("density", {
  expect_equal(density_process_model(doc), 20 / (16 * 15))
  expect_equal(density_process_model(doc_modified), 24 / (19 * 18))
  expect_equal(density_process_model(doc_empty), 0)
  expect_equal(density_process_model(doc_event), 0)
  expect_equal(density_process_model(doc_simple), 0.25)
  expect_equal(number_sequence_flows(create_internal_doc(doc)), 20)
  expect_equal(number_sequence_flows(create_internal_doc(doc_modified)), 24)
  expect_equal(number_sequence_flows(create_internal_doc(doc_empty)), 0)
  expect_equal(number_sequence_flows(create_internal_doc(doc_event)), 0)
  expect_equal(number_sequence_flows(create_internal_doc(doc_simple)), 3)
})

context("coefficient network connectivity")
test_that("coefficient network connectivity", {
  expect_equal(coefficient_network_connectivity(doc), 20 / 16)
  expect_equal(coefficient_network_connectivity(doc_modified), 24 / 19)
  expect_equal(coefficient_network_connectivity(doc_empty), 0)
  expect_equal(coefficient_network_connectivity(doc_event), 0)
  expect_equal(coefficient_network_connectivity(doc_simple), 0.75)
})

context("average connector degree")
 test_that("average connector degree", {
  expect_equal(avg_connector_degree(doc), 23 / 6)
  expect_equal(avg_connector_degree(doc_modified), 29 / 8)
  expect_equal(avg_connector_degree(doc_empty), 0)
  expect_equal(avg_connector_degree(doc_event), 0)
  expect_equal(avg_connector_degree(doc_simple), 0)
})

context("maximum connector degree")
test_that("maximum connector degree", {
  expect_equal(max_connector_degree(doc), 6)
  expect_equal(max_connector_degree(doc_modified), 6)
  expect_equal(max_connector_degree(doc_empty), 0)
  expect_equal(max_connector_degree(doc_event), 0)
  expect_equal(max_connector_degree(doc_simple), 0)
})

context("separability")
test_that("separability", {
  expect_equal(separability(doc, generate_new_path_log = TRUE), 3 / 14)
  expect_equal(separability(doc_modified, generate_new_path_log = TRUE), 3 / 17)
  expect_equal(separability(doc_empty, generate_new_path_log = TRUE), 1)
  expect_equal(separability(doc_event, generate_new_path_log = TRUE), 1)
  expect_equal(separability(doc_simple, generate_new_path_log = TRUE), 1.5)
})

context("sequentiality")
test_that("sequentiality", {
  expect_equal(sequentiality(doc), 1 / 20)
  expect_equal(sequentiality(doc_modified), 1 / 24)
  expect_equal(sequentiality(doc_empty), NaN)
  expect_equal(sequentiality(doc_event), NaN)
  expect_equal(sequentiality(doc_simple), 1)
})


context("cyclicity")
test_that("cyclicity", {
  expect_equal(cyclicity(doc, generate_new_path_log = TRUE), 1 / 4)
  expect_equal(cyclicity(doc_modified, generate_new_path_log = TRUE), 4 / 19)
  expect_equal(cyclicity(doc_empty, generate_new_path_log = TRUE), NaN)
  expect_equal(cyclicity(doc_event, generate_new_path_log = TRUE), 0)
  expect_equal(cyclicity(doc_simple, generate_new_path_log = TRUE), 0)
})

context("diameter")
test_that("diameter", {
  expect_equal(diameter(doc, generate_new_path_log = TRUE), 16)
  expect_equal(diameter(doc_modified, generate_new_path_log = TRUE), 18)
  expect_equal(diameter(doc_empty, generate_new_path_log = TRUE), 0)
  expect_equal(diameter(doc_event, generate_new_path_log = TRUE), 1)
  expect_equal(diameter(doc_simple, generate_new_path_log = TRUE), 4)
})

context("structuredness")
test_that("structuredness", {
  expect_equal(structuredness(doc, generate_new_path_log = TRUE), 7 / 8)
  expect_equal(structuredness(doc_modified, generate_new_path_log = TRUE), 17 / 19)
  expect_equal(structuredness(doc_empty, generate_new_path_log = TRUE), NaN)
  expect_equal(structuredness(doc_event, generate_new_path_log = TRUE), 1)
  expect_equal(structuredness(doc_simple, generate_new_path_log = TRUE), 1)
})

context("depth")
test_that("depth", {
  expect_equal(depth(doc, generate_new_path_log = TRUE), 1)
  expect_equal(depth(doc_modified, generate_new_path_log = TRUE), 2)
  expect_equal(depth(doc_empty, generate_new_path_log = TRUE), 0)
  expect_equal(depth(doc_event, generate_new_path_log = TRUE), 0)
  expect_equal(depth(doc_simple, generate_new_path_log = TRUE), 0)
})

context("token split")
test_that("token split", {
  expect_equal(token_split(doc), 4)
  expect_equal(token_split(doc_modified), 4)
  expect_equal(token_split(doc_empty), 0)
  expect_equal(token_split(doc_event), 0)
  expect_equal(token_split(doc_simple), 0)
})

context("Control flow complexity")
test_that("Control flow complexity", {
  expect_equal(control_flow_complexity(doc), 4)
  expect_equal(control_flow_complexity(doc_modified), 6)
  expect_equal(control_flow_complexity(doc_empty), 0)
  expect_equal(control_flow_complexity(doc_event), 0)
  expect_equal(control_flow_complexity(doc_simple), 0)
})

context("Connector mismatch")
test_that("Connector mismatch", {
  expect_equal(connector_mismatch(doc), 3)
  expect_equal(connector_mismatch(doc_modified), 3)
  expect_equal(connector_mismatch(doc_empty), 0)
  expect_equal(connector_mismatch(doc_event), 0)
  expect_equal(connector_mismatch(doc_simple), 0)
})

context("Connector heterogeneity")
test_that("Connector heterogeneity", {
  expect_equal(connector_heterogeneity(doc), -4/7 * log(base = 2, x = 4/7) - 3/7 * log(base = 2, x = 3/7))
  expect_equal(connector_heterogeneity(doc_modified), -3/9 * log(base = 2, x = 3/9) - 6/9 * log(base = 2, x = 6/9))
  expect_equal(connector_heterogeneity(doc_empty), 0)
  expect_equal(connector_heterogeneity(doc_event), 0)
  expect_equal(connector_heterogeneity(doc_simple), 0)
})

context("Cyclomatic metric")
test_that("Cyclomatic metric", {
  expect_equal(cyclomatic_metric(doc, generate_new_path_log = TRUE), 5)
  expect_equal(cyclomatic_metric(doc_modified, generate_new_path_log = TRUE),5)
  expect_equal(cyclomatic_metric(doc_empty, generate_new_path_log = TRUE), 0)
  expect_equal(cyclomatic_metric(doc_event, generate_new_path_log = TRUE), 0)
  expect_equal(cyclomatic_metric(doc_simple, generate_new_path_log = TRUE), 2)
})

context("Cross connectivity")
test_that("Cross connectivity", {
  expect_equal(round(cross_connectivity(doc, generate_new_path_log = TRUE), digits = 7), 0.1975309)
  expect_equal(round(cross_connectivity(doc_modified, generate_new_path_log = TRUE), digits = 7),0.1454408)
  expect_equal(cross_connectivity(doc_empty, generate_new_path_log = TRUE), NA)
  expect_equal(cross_connectivity(doc_event, generate_new_path_log = TRUE), 0)
  expect_equal(cross_connectivity(doc_simple, generate_new_path_log = TRUE), 0.5)
})
