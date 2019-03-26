## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(eval = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  library(onnx)
#  
#  node_def <- make_node("Relu", list("X"), list("Y"))
#  check(node_def)

## ----eval=FALSE----------------------------------------------------------
#  > node_def
#  input: "X"
#  output: "Y"
#  op_type: "Relu"

## ----eval=FALSE----------------------------------------------------------
#  attr_def <- make_attribute("this_is_an_int", 123L)
#  check(attr_def)

## ----eval=FALSE----------------------------------------------------------
#  > attr_def
#  name: "this_is_an_int"
#  i: 123
#  type: INT

## ----eval=FALSE----------------------------------------------------------
#  graph_def <- make_graph(
#    nodes = list(
#      make_node("FC", list("X", "W1", "B1"), list("H1")),
#      make_node("Relu", list("H1"), list("R1")),
#      make_node("FC", list("R1", "W2", "B2"), list("Y"))
#    ),
#    name = "MLP",
#    inputs = list(
#      make_tensor_value_info('X' , onnx$TensorProto$FLOAT, list(1L)),
#      make_tensor_value_info('W1', onnx$TensorProto$FLOAT, list(1L)),
#      make_tensor_value_info('B1', onnx$TensorProto$FLOAT, list(1L)),
#      make_tensor_value_info('W2', onnx$TensorProto$FLOAT, list(1L)),
#      make_tensor_value_info('B2', onnx$TensorProto$FLOAT, list(1L))
#    ),
#    outputs = list(
#      make_tensor_value_info('Y', onnx$TensorProto$FLOAT, list(1L))
#    )
#  )
#  check(graph_def)

## ----eval=FALSE----------------------------------------------------------
#  > print_readable(graph_def)
#  graph MLP (
#    %X[FLOAT, 1]
#    %W1[FLOAT, 1]
#    %B1[FLOAT, 1]
#    %W2[FLOAT, 1]
#    %B2[FLOAT, 1]
#  ) {
#    %H1 = FC(%X, %W1, %B1)
#    %R1 = Relu(%H1)
#    %Y = FC(%R1, %W2, %B2)
#    return %Y
#  }

## ----eval=FALSE----------------------------------------------------------
#  > graph_def
#  node {
#    input: "X"
#    input: "W1"
#    input: "B1"
#    output: "H1"
#    op_type: "FC"
#  }
#  node {
#    input: "H1"
#    output: "R1"
#    op_type: "Relu"
#  }
#  node {
#    input: "R1"
#    input: "W2"
#    input: "B2"
#    output: "Y"
#    op_type: "FC"
#  }
#  name: "MLP"
#  input {
#    name: "X"
#    type {
#      tensor_type {
#        elem_type: FLOAT
#        shape {
#          dim {
#            dim_value: 1
#          }
#        }
#      }
#    }
#  }
#  input {
#    name: "W1"
#    type {
#      tensor_type {
#        elem_type: FLOAT
#        shape {
#          dim {
#            dim_value: 1
#          }
#        }
#      }
#    }
#  }
#  input {
#    name: "B1"
#    type {
#      tensor_type {
#        elem_type: FLOAT
#        shape {
#          dim {
#            dim_value: 1
#          }
#        }
#      }
#    }
#  }
#  input {
#    name: "W2"
#    type {
#      tensor_type {
#        elem_type: FLOAT
#        shape {
#          dim {
#            dim_value: 1
#          }
#        }
#      }
#    }
#  }
#  input {
#    name: "B2"
#    type {
#      tensor_type {
#        elem_type: FLOAT
#        shape {
#          dim {
#            dim_value: 1
#          }
#        }
#      }
#    }
#  }
#  output {
#    name: "Y"
#    type {
#      tensor_type {
#        elem_type: FLOAT
#        shape {
#          dim {
#            dim_value: 1
#          }
#        }
#      }
#    }
#  }

