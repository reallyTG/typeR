doc <- create_internal_doc("paper_diagram.bpmn")
doc_modified <- create_internal_doc("paper_diagram_modified.bpmn")
repetition_log <- create_path_and_repetition_log("paper_diagram.bpmn")
repetition_log_modified <- create_path_and_repetition_log("paper_diagram_modified.bpmn")
doc_empty <- create_internal_doc("paper_diagram_empty.bpmn")
repetition_log_empty <- create_path_and_repetition_log("paper_diagram_empty.bpmn")
doc_event <- create_internal_doc("paper_diagram_event.bpmn")
repetition_log_event <- create_path_and_repetition_log("paper_diagram_event.bpmn")
doc_simple <- create_internal_doc("paper_diagram_simple.bpmn")
repetition_log_simple <- create_path_and_repetition_log("paper_diagram_simple.bpmn")

type <- "//bpmn:task | //bpmn:sendTask | //bpmn:receiveTask |
//bpmn:manualTask | //bpmn:businessRuleTask | //bpmn:userTask | //bpmn:scriptTask |
//bpmn:subProcess | //bpmn:callActivity | //task"

context("tasks, gateways and events")
test_that("tasks, gateways and events", {
  expect_equal(number_tasks(doc), 8)
  expect_equal(number_tasks(doc_modified), 9)
  expect_equal(number_tasks(doc_empty), 0)
  expect_equal(number_tasks(doc_event), 0)
  expect_equal(number_tasks(doc_simple), 2)
  expect_equal(number_events(doc), 3)
  expect_equal(number_events(doc_modified), 3)
  expect_equal(number_events(doc_empty), 0)
  expect_equal(number_events(doc_event), 1)
  expect_equal(number_events(doc_simple), 2)
  expect_equal(number_AND_gateways(doc), 2)
  expect_equal(number_AND_gateways(doc_modified), 2)
  expect_equal(number_AND_gateways(doc_empty), 0)
  expect_equal(number_AND_gateways(doc_event), 0)
  expect_equal(number_AND_gateways(doc_simple), 0)
  expect_equal(number_XOR_gateways(doc), 3)
  expect_equal(number_XOR_gateways(doc_modified), 5)
  expect_equal(number_XOR_gateways(doc_empty), 0)
  expect_equal(number_XOR_gateways(doc_event), 0)
  expect_equal(number_XOR_gateways(doc_simple), 0)
  expect_equal(number_OR_gateways(doc), 0)
  expect_equal(number_OR_gateways(doc_modified), 0)
  expect_equal(number_OR_gateways(doc_empty), 0)
  expect_equal(number_OR_gateways(doc_event), 0)
  expect_equal(number_OR_gateways(doc_simple), 0)
  expect_equal(number_complex_gateways(doc), 0)
  expect_equal(number_complex_gateways(doc_modified), 0)
  expect_equal(number_complex_gateways(doc_empty), 0)
  expect_equal(number_complex_gateways(doc_event), 0)
  expect_equal(number_complex_gateways(doc_simple), 0)
  expect_equal(number_event_based_gateways(doc), 0)
  expect_equal(number_event_based_gateways(doc_modified), 0)
  expect_equal(number_event_based_gateways(doc_empty), 0)
  expect_equal(number_event_based_gateways(doc_event), 0)
  expect_equal(number_event_based_gateways(doc_simple), 0)
})

context("node id")
test_that("node id", {
  expect_equal(node_ids(doc, type, TRUE),
               c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss", "Task_099rp4f",
                 "Task_0d8b2ac", "Task_1qiqt0s", "Task_0glvglb"))
  expect_equal(node_ids(doc, type, FALSE),
               c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss", "Task_099rp4f",
                 "Task_0d8b2ac", "Task_1qiqt0s", "Task_0glvglb", "Task_1ug8uhm"))
  expect_equal(node_ids(doc, type),
               c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss", "Task_099rp4f",
                 "Task_0d8b2ac", "Task_1qiqt0s", "Task_0glvglb", "Task_1ug8uhm"))
  expect_null(node_ids(doc_event, type, TRUE))
  expect_null(node_ids(doc_event, type, FALSE))
})

#set up expected tables task names
task_id_w_connector <- c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss", "Task_099rp4f",
  "Task_0d8b2ac", "Task_1qiqt0s", "Task_0glvglb", "Task_1ug8uhm")
task_names_w_connector <- c("A", "A", "A", "F", "E", "D", "C", "C")
task_id_wo_connector <- c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss", "Task_099rp4f",
                         "Task_0d8b2ac", "Task_1qiqt0s", "Task_0glvglb")
task_names_wo_connector <- c("A", "A", "A", "F", "E", "D", "C")


context("task names")
test_that("task names", {
  expect_true(all.equal(as.character(task_names(doc, FALSE)$task_names), task_names_w_connector))
  expect_true(all.equal(as.character(task_names(doc, FALSE)$task_id), task_id_w_connector))
  expect_true(all.equal(as.character(task_names(doc, TRUE)$task_names), task_names_wo_connector))
  expect_true(all.equal(as.character(task_names(doc, TRUE)$task_id), task_id_wo_connector))
  expect_true(all.equal(as.character(task_names(doc)$task_names), task_names_w_connector))
  expect_true(all.equal(as.character(task_names(doc)$task_id), task_id_w_connector))

  expect_equal(task_names(doc_event, FALSE), data.frame())
  expect_equal(task_names(doc_event, TRUE), data.frame())
  expect_equal(task_names(doc_event), data.frame())
})

context("sequence flows")
test_that("sequence flows", {
  expect_equal(number_sequence_flows(doc), 20)
  expect_equal(number_sequence_flows(doc_empty), 0)
  expect_equal(number_sequence_flows(doc_event), 0)
  expect_equal(number_sequence_flows(doc_simple), 3)
  expect_equal(number_sequence_flows(doc_modified), 24)
})

exclusive_gateways_doc <- c(3,3,3)
exclusive_gateways_modified <- c(3,3,3,3,3)

parallel_gateways_doc <- c(4,4)
parallel_gateways_modified <- c(4,4)

context("incoming outgoing flows gateways")
test_that("incoming outgoing flows gateways and activities", {
  expect_equal(total_io_flows_gateways(doc), 17)
  expect_equal(total_io_flows_gateways(doc_empty), 0)
  expect_equal(total_io_flows_gateways(doc_event), 0)
  expect_equal(total_io_flows_gateways(doc_simple), 0)
  expect_equal(total_io_flows_gateways(doc_modified), 23)
  expect_equal(max_io_flows_gateways_activities(doc), 6)
  expect_equal(max_io_flows_gateways_activities(doc_modified), 6)
  expect_equal(max_io_flows_gateways_activities(doc_empty), 0)
  expect_equal(max_io_flows_gateways_activities(doc_event), 0)
  expect_equal(max_io_flows_gateways_activities(doc_simple), 0)
  expect_equal(number_io_flows_gateway(doc, "//bpmn:exclusiveGateway"), exclusive_gateways_doc)
  expect_equal(number_io_flows_gateway(doc, "//bpmn:parallelGateway"), parallel_gateways_doc)
  expect_equal(number_io_flows_gateway(doc_modified, "//bpmn:exclusiveGateway"), exclusive_gateways_modified)
  expect_equal(number_io_flows_gateway(doc_modified, "//bpmn:parallelGateway"), parallel_gateways_modified)
  expect_equal(number_io_flows_gateway(doc_empty, "//bpmn:exclusiveGateway"), integer())
  expect_equal(number_io_flows_gateway(doc_empty, "//bpmn:parallelGateway"), integer())
  expect_equal(number_io_flows_activities_with_id(doc, c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss",
                                                         "Task_099rp4f", "Task_0d8b2ac", "Task_1qiqt0s",
                                                         "Task_0glvglb", "Task_1ug8uhm")), 20)
  expect_equal(number_io_flows_activities_with_id(doc_modified, c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss",
                                                                  "Task_099rp4f", "Task_0d8b2ac", "Task_1qiqt0s",
                                                                  "Task_0glvglb", "Task_1ug8uhm")), 20)
  expect_equal(number_io_flows_activities_with_id(doc_event, c("Task_0e55sii", "Task_1yok2qw", "Task_1ehfjss",
                                                                  "Task_099rp4f", "Task_0d8b2ac", "Task_1qiqt0s",
                                                                  "Task_0glvglb", "Task_1ug8uhm")), 0)
  expect_equal(number_incoming_flows(doc, "//bpmn:exclusiveGateway"), c(2,2,1))
  expect_equal(number_incoming_flows(doc, "//bpmn:parallelGateway"), c(3,1))
  expect_equal(number_incoming_flows(doc_modified, "//bpmn:exclusiveGateway"), c(2,2,1,1,2))
  expect_equal(number_incoming_flows(doc_modified, "//bpmn:parallelGateway"), c(3,1))
  expect_null(number_incoming_flows(doc_event, "//bpmn:exclusiveGateway"))
  expect_null(number_incoming_flows(doc_event, "//bpmn:parallelGateway"))
  expect_equal(number_outgoing_flows(doc, "//bpmn:exclusiveGateway"), c(1,1,2))
  expect_equal(number_outgoing_flows(doc, "//bpmn:parallelGateway"), c(1,3))
  expect_equal(number_outgoing_flows(doc_modified, "//bpmn:exclusiveGateway"), c(1,1,2,2,1))
  expect_equal(number_outgoing_flows(doc_modified, "//bpmn:parallelGateway"), c(1,3))
  expect_null(number_outgoing_flows(doc_event, "//bpmn:exclusiveGateway"))
  expect_null(number_outgoing_flows(doc_event, "//bpmn:parallelGateway"))
})

context("split join gateways")
test_that("split join gateways", {
  expect_equal(split_gateways(doc, "//bpmn:exclusiveGateway"), "ExclusiveGateway_1w6z1ap")
  expect_equal(split_gateways(doc, "//bpmn:parallelGateway"), "ExclusiveGateway_02r0dym")
  expect_equal(split_gateways(doc_modified, "//bpmn:exclusiveGateway"), c("ExclusiveGateway_1w6z1ap", "ExclusiveGateway_1vxu29r"))
  expect_equal(split_gateways(doc_modified, "//bpmn:parallelGateway"), "ExclusiveGateway_02r0dym")
  expect_equal(number_split_gateways(doc, "//bpmn:exclusiveGateway"), 1)
  expect_equal(number_split_gateways(doc, "//bpmn:parallelGateway"), 1)
  expect_equal(number_split_gateways(doc_modified, "//bpmn:exclusiveGateway"), 2)
  expect_equal(number_split_gateways(doc_modified, "//bpmn:parallelGateway"), 1)
  expect_equal(number_split_gateways(doc_event, "//bpmn:exclusiveGateway"), 0)
  expect_equal(number_split_gateways(doc_event, "//bpmn:parallelGateway"), 0)
  expect_null(split_gateways(doc_event, "//bpmn:exclusiveGateway"))
  expect_null(split_gateways(doc_event, "//bpmn:parallelGateway"))
  expect_equal(all_split_gateways(doc), c("ExclusiveGateway_1w6z1ap", "ExclusiveGateway_02r0dym"))
  expect_equal(all_split_gateways(doc_modified), c("ExclusiveGateway_1w6z1ap", "ExclusiveGateway_02r0dym", "ExclusiveGateway_1vxu29r"))
  expect_null(all_split_gateways(doc_event))
  expect_equal(join_gateways(doc, "//bpmn:exclusiveGateway"), c("ExclusiveGateway_1wr5qja", "ExclusiveGateway_162lq5t"))
  expect_equal(join_gateways(doc, "//bpmn:parallelGateway"), "ExclusiveGateway_16qlp2d")
  expect_equal(join_gateways(doc_modified, "//bpmn:exclusiveGateway"), c("ExclusiveGateway_1wr5qja", "ExclusiveGateway_162lq5t", "ExclusiveGateway_1hc1vqf"))
  expect_equal(join_gateways(doc_modified, "//bpmn:parallelGateway"), "ExclusiveGateway_16qlp2d")
  expect_equal(number_join_gateways(doc, "//bpmn:exclusiveGateway"), 2)
  expect_equal(number_join_gateways(doc, "//bpmn:parallelGateway"), 1)
  expect_equal(number_join_gateways(doc_modified, "//bpmn:exclusiveGateway"), 3)
  expect_equal(number_join_gateways(doc_modified, "//bpmn:parallelGateway"), 1)
  expect_equal(number_join_gateways(doc_event, "//bpmn:exclusiveGateway"), 0)
  expect_equal(number_join_gateways(doc_event, "//bpmn:parallelGateway"), 0)
  expect_null(join_gateways(doc_event, "//bpmn:exclusiveGateway"))
  expect_null(join_gateways(doc_event, "//bpmn:parallelGateway"))
  expect_equal(all_join_gateways(doc), c("ExclusiveGateway_1wr5qja", "ExclusiveGateway_162lq5t", "ExclusiveGateway_16qlp2d"))
  expect_equal(all_join_gateways(doc_modified), c("ExclusiveGateway_1wr5qja", "ExclusiveGateway_162lq5t", "ExclusiveGateway_16qlp2d", "ExclusiveGateway_1hc1vqf"))
  expect_null(all_split_gateways(doc_event))
})

